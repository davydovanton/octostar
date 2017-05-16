class UpdateProjectsWorker
  include Sidekiq::Worker

  def perform
    AccountRepository.new.all.each do |account|
      NewProjectSaver.new.call(account.id)
    end
  end
end
