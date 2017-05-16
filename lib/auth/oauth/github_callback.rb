class GithubCallback < WebBouncer::OauthCallback
  def call(oauth_response)
    account = repo.find_by_login(oauth_response['info']['nickname'])

    unless account
      account = repo.create(oauth_data(oauth_response))
      GetStarredProjectsWorker.perform_async(account.id)
    end
    Right(account)
  end

  private

  def repo
    @repo ||= AccountRepository.new
  end

  def oauth_data(data)
    {
      login:     data['info']['nickname'],
      email:     data['info']['email'],
      name:      data['info']['name'],
      image_url: data['info']['image']
    }
  end
end
