class AccountRepository < Hanami::Repository
  def find_by_login(login)
    accounts.where(login: login).one
  end
end
