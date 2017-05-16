module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def footer
        html.div(class: 'footer row') do
          div(class: 'col-md-4 col-md-offset-4 center') do
            text '© 2017'
            a(href: 'https://github.com/davydovanton/') { 'Anton Davydov,' }
            text 'et al —'
            a(href: 'https://github.com/davydovanton/octostar') { 'Source' }
            text 'available under'
            a(href: 'https://github.com/davydovanton/octostar/blob/master/LICENSE.txt') { 'MIT' }
          end
        end
      end
    end
  end
end
