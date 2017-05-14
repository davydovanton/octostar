module Web::Controllers::Repos
  class Index
    include Web::Action
    expose :projects

    def initialize
      @projects = []
    end

    def call(params)
      if authenticated?
        @projects = repo.find_by_account(current_account.id, params[:query])
      end
    end

    private

    def repo
      @repo ||= ProjectRepository.new
    end
  end
end
