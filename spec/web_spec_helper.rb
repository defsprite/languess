require 'spec_helper'

require 'sinatra'
require 'rack/test'

require_relative '../lib/languess_web'

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  LanguessWeb
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
