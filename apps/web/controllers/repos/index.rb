module Web::Controllers::Repos
  class Index
    include Web::Action
    expose :projects

    INVALID_CHARS = /[^\w:\s+-]/

    def initialize
      @projects = []
    end

    def call(params)
      if authenticated?
        params[:query].gsub!(INVALID_CHARS, '') if params[:query]

        search_params = SearchQueryParser.new(params[:query]).call
        @projects = repo.find_by_account(current_account.id, search_params, limit)
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
