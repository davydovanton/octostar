require_relative '../../http_request'

class StarredProjectsGetter
  API_URL = 'https://api.github.com/users/%{username}/starred?client_id=%{github_id}&client_secret=%{github_key}&page=%{page}&count=100'.freeze

  COMMITS_COUNT_ON_PAGE = 100

  def initialize(requester = HttpRequest)
    @requester = requester
  end

  def call(account)
    projects = []

    page = 1
    while (raw_projects = get_response(account.login, page)) && !raw_projects.empty?
      page += 1
      raw_projects.each { |data| projects << project_information(data, account.id) }
    end

    projects
  end

  private

    def project_information(data, account_id)
      # column :starred_at, DateTime, null: false
      {
        url: data['repo']['html_url'],
        name: data['repo']['name'],
        owner: data['repo']['owner']['login'],
        description: data['repo']['description'],
        private: data['repo']['private'],
        language: data['repo']['language'],
        stargazers_count: data['repo']['stargazers_count'],
        topics: Array(data['repo']['topics']),
        account_id: account_id,
        starred_at:  Time.parse(data['starred_at']),
        created_at:  Time.parse(data['repo']['created_at']),
        updated_at:  Time.parse(data['repo']['updated_at'])
      }
    end

  def get_response(username, page)
    params = {
      username: username,
      page: page,
      github_id: ENV['GITHUB_KEY'],
      github_key: ENV['GITHUB_SECRET']
    }

    response = @requester.new(API_URL % params).get
    return [] unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.body)
  end
end
