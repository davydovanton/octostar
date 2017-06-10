module Web::Controllers::Repos
  class Index
    include Web::Action
    expose :projects

    def initialize
      @projects = []
    end

    def call(params)
      if authenticated?
        result = SearchParams.new(params[:query]).call
        @projects = repo.find_by_account(current_account.id, result.params, limit)
      end
    end

    private

    DEFAULT_LIMIT = 100

    def repo
      @repo ||= ProjectRepository.new
    end

    def limit
      params[:limit] || DEFAULT_LIMIT
    end
  end
end
