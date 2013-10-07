require_relative 'github_api'
require_relative 'stats_collector'

class Languess

  class Error < StandardError; end

  def guess_language_for(username)
    raise ArgumentError.new("Please specify a username to guess the language for.") if username.nil? || username.empty?

    begin
      stats_collector = StatsCollector.new(GithubAPI.new)
      language_stats = stats_collector.collect_stats_for(username)
    rescue GithubAPI::Error => e
      raise Error.new("Unable to guess language for user #{username}. Error: #{e}")
    end

    language_stats.first[0]
  end

end
