module Services
  class NewProjectSaver
    def initialize
      @account_repo = AccountRepository.new
      @project_repo = ProjectRepository.new
    end

    def call(id)
      account = account_repo.find_with_projects(id)
      project_names = account.projects.map(&:name)
      projects = Services::StarredProjectsGetter.new
        .call(account)
        .select { |p| !project_names.include?(p[:name]) }

      project_repo.create(projects)
    end

  private

    attr_reader :account_repo, :project_repo
  end
end
