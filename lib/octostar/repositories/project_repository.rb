class ProjectRepository < Hanami::Repository
  def find_by_account(account_id, search = {})

    query = projects.where(account_id: account_id)
    query = text_search(query, search[:text])
    query = author_search(query, search[:author])
    query = language_search(query, search[:lang])
    query = tags_search(query, search[:tag])

    query.as(Project).to_a
  end

private

  def text_search(query, text)
    return query if text.nil?

    text = "%#{text}%"
    query.where { name.like(text) | description.like(text) }
  end

  def author_search(query, author)
    return query if author.nil?

    author = "%#{author}%"
    query.where { owner.like(author) }
  end

  def language_search(query, lang)
    return query if lang.nil?

    lang = "%#{lang}%"
    query.where { lower(language).like(lang) }
  end

  def tags_search(query, tag)
    return query if tag.nil?

    Array(tag).each do |topic|
      topic = "%#{topic}%"
      query = query.where { array_to_string(topics, ',').like(topic) }
    end
    query
  end
end
