module Web::Controllers::Repos
  class Index
    include Web::Action
    expose :projects

    def initialize
      @projects = []
    end

    def call(params)
      if authenticated?
        params[:query].gsub!(/[^\w:\s]/, '') if params[:query]

        search_params = SearchQueryParser.new(params[:query]).call
        @projects = repo.find_by_account(current_account.id, search_params)
      end
    end

    private

    def repo
      @repo ||= ProjectRepository.new
    end
  end
end
