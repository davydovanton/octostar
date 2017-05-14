class ProjectRepository < Hanami::Repository
  def find_by_account(account_id)
    projects.where(account_id: account_id).as(Project).to_a
  end
end
