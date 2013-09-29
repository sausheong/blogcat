require 'cuba'
require 'cuba/render'
require 'rack/protection'
require 'rack/static'
require 'slim'
require 'sequel'
require 'rest-client'
require 'json'

ENV['FACEBOOK_APP_ID']='135195879988048'
ENV['FACEBOOK_APP_SECRET']='2bd0d55a02a13c18b9c9d2df9269f7d9'

Cuba.use Rack::Session::Cookie, :secret => '__blogcat_blogs__'
Cuba.use Rack::Protection
Cuba.use Rack::Static,
  urls: %w[/js /css /images],
  root: "./public"

Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = 'slim'

