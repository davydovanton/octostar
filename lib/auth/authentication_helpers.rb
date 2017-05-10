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
    !!current_account
  end

  def current_account
    session[:account]
  end
end
