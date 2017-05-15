module Web::Controllers::Repos
  class Index
    include Web::Action
    expose :projects

    def initialize
      @projects = []
    end

    def call(params)
      if authenticated?
        search_params = SearchQueryParser.new.call(params[:query])
        @projects = repo.find_by_account(current_account.id, search_params)
      end
    end

    private

    def repo
      @repo ||= ProjectRepository.new
    end
  end
end
