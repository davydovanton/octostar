module Web::Views::Repos
  class Index
    include Web::View

    def title(project)
      link_to "#{project.owner}/#{project.name}", project.url, target: '_blank'
    end
  end
end
