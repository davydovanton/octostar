class GetStarredProjectsWorker
  include Sidekiq::Worker

  def perform(id)
    Services::NewProjectSaver.new.call(id)
  end
end
