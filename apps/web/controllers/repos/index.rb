module Web::Controllers::Repos
  class Index
    include Web::Action
    expose :projects, :invalid_params, :search_text

    def initialize
      @projects = []
    end

    def call(params)
      if authenticated?
        result = Interactor::SearchParams.new(params[:query]).call

        @search_text = result.params[:text]
        @invalid_params = result.invalid_params
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
