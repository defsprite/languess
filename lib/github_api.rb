require 'songkick/transport'

class GithubAPI

  class Error < StandardError; end

  def initialize
    # Songkick::Transport.verbose = true
    @client = Songkick::Transport::HttParty.new('https://api.github.com')
  end

  def get_user_repos(username)
    get("/users/#{username}/repos")
  end

  private

  def get(path, options = {})
    begin
      res = @client.get(path, {:per_page => 1000}.merge(options))
    rescue => e
      raise Error.new("Error during API call: #{e}")
    end
    raise Error.new("Unexpected API response: #{res.inspect}") unless res.is_a?(Songkick::Transport::Response::OK)

    res.data
  end


end
