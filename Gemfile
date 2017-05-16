source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.0'
gem 'hanami-model', '~> 1.0'

gem 'pg'

# auth
gem 'omniauth'
gem 'omniauth-github', github: 'intridea/omniauth-github'
gem 'web_bouncer',     github: 'davydovanton/web_bouncer'

# view
gem 'slim'
gem 'hanami-bootstrap'
gem 'jquery-hanami'
gem 'sass'

# background
gem 'sidekiq'
gem 'sidekiq-scheduler'

# redis
gem 'redis', '~>3.2'
gem 'hiredis'
gem 'mock_redis'
gem 'connection_pool'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rspec-hanami'
end

group :production do
  # gem 'puma'
end
