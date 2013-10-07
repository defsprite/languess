require_relative 'github_api'

class Languess

  def initialize(api_klass = GithubAPI)
    @api = api_klass.new
  end


  def guess_language_for(username)
    raise ArgumentError.new("Please specify a username ot guess the language for.") if username.nil? || username.empty?


    "JavaScript"
  end

end
