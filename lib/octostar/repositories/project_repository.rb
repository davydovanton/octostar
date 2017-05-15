class ProjectRepository < Hanami::Repository
  def find_by_account(account_id, search = {})

    query = projects.where(account_id: account_id)
    query = text_search(query, search[:text])
    query = author_search(query, search[:author])

    query.as(Project).to_a
  end

private

  def text_search(query, text)
    if text
      text = "%#{text}%"
      query.where { name.like(text) | description.like(text) }
    else
      query
    end
  end

  def author_search(query, author)
    if author
      author = "%#{author}%"
      query.where { owner.like(author) }
    else
      query
    end
  end
end
