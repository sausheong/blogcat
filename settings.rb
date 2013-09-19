require 'cuba'
require 'cuba/render'
require 'rack/protection'
require 'rack/static'
require 'slim'

Cuba.use Rack::Session::Cookie, :secret => '__blogcat_blogs__'
Cuba.use Rack::Protection
Cuba.use Rack::Static,
  urls: %w[/js /css /images],
  root: "./public"

Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = 'slim'
