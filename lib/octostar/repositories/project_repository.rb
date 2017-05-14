class ProjectRepository < Hanami::Repository
  def find_by_account(account_id, text = nil)

    query = projects.where(account_id: account_id)

    if text
      text = "%#{text}%"
      query = query.where { name.like(text) | description.like(text) }
    end

    query.as(Project).to_a
  end
end
