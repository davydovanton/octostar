class ProjectRepository < Hanami::Repository
  def find_by_account(account_id, search = {}, limit = 100)
    query = projects.where(account_id: account_id)
    query = text_search(query, search[:text])
    query = author_search(query, search[:author])
    query = language_search(query, search[:lang] || search[:language])
    query = tags_search(query, search[:tag])

    query.order{ starred_at.desc }.limit(limit).as(Project).to_a
  end

private

  def pattern(text)
    "%#{text.downcase}%"
  end

  def text_search(query, text)
    return query if text.nil?

    text = pattern(text)
    query.where { name.ilike(text) | description.ilike(text) }
  end

  def author_search(query, author)
    return query if author.nil?

    author = pattern(author)
    query.where { owner.ilike(author) }
  end

  def language_search(query, lang)
    return query if lang.nil?

    lang = pattern(lang)
    query.where { language.ilike(lang) }
  end

  def tags_search(query, tag)
    return query if tag.nil?

    Array(tag).each do |topic|
      topic = pattern(topic)
      query = query.where { array_to_string(topics, ',').ilike(topic) }
    end
    query
  end
end
