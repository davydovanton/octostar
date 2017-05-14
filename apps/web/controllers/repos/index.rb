module Web::Controllers::Repos
  class Index
    include Web::Action
    expose :projects

    def initialize
      @projects = []
    end

    def call(params)
      @projects = repo.find_by_account(current_account.id) if authenticated?
    end

    private

    def repo
      @repo ||= ProjectRepository.new
    end
  end
end
