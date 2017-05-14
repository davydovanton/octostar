class AccountRepository < Hanami::Repository
  associations do
    has_many :projects
  end

  def find_by_login(login)
    accounts.where(login: login).one
  end

  def find_with_projects(id)
    aggregate(:projects).where(id: id).as(Account).one
  end
end
