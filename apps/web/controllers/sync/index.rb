module Web::Controllers::Sync
  class Index
    include Web::Action

    def call(params)
      GetStarredProjectsWorker.perform_async(current_account.id)
      redirect_to '/'
    end
  end
end
