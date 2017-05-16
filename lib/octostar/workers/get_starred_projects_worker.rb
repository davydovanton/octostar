class GetStarredProjectsWorker
  include Sidekiq::Worker

  def perform(id)
    NewProjectSaver.new.call(id)
  end
end
