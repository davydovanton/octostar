module Web::Views::Repos
  class Index
    include Web::View

    def title(project)
      link_to "#{project.owner}/#{project.name}", project.url, target: '_blank'
    end

    def waiting_projects
      if projects.empty? && params[:query].nil?
        html.div(class: 'projects__waiting') do
          text('We are getting your starred projects...')
          br
          text('Please reload the page in few minutes.')
        end
      end
    end

    def error_message
      if invalid_params && invalid_params.any?
        html.div(class: '.errors') do
          text "Imvalid command(s) "
          b "#{invalid_params.join(', ')}"
        end
      end
    end
  end
end
