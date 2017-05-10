require './config/environment'

require 'web_bouncer'
require "web_bouncer/oauth_middleware"

use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], provider_ignores_state: true
end

use Rack::Session::Cookie, secret: ENV['SESSIONS_SECRET']
use WebBouncer['middleware.oauth']
run Hanami.app
