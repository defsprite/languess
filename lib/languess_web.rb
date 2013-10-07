require 'sinatra/base'
require 'languess'

class LanguessWeb < Sinatra::Base

  set :root, File.expand_path(File.dirname(__FILE__) + "../../web")
  set :public_folder, Proc.new { "#{root}/assets" }
  set :views, Proc.new { "#{root}/views" }

  get '/' do
    erb :welcome
  end

  post '/languess' do
    halt 404 unless params['username']

    begin
      @result = Languess.guess_language_for(params['username'])
    rescue Languess::GithubAPI::Error => e
      @error = e
      halt erb :error
    end

    erb :result
  end

  run! if app_file == $0
end
