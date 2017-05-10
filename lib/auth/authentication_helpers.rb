module AuthenticationHelpers
  def self.included(action)
    action.class_eval do
      before :authenticate!
      expose :current_account
    end
  end

private

  def authenticate!
  end

  def authenticated?
    !!current_account.id
  end

  def current_account
    @current_account ||= Account.new(session[:account])
  end
end
