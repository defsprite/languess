require 'languess/github_api'
require 'languess/stats_collector'

module Languess

  class Error < StandardError; end

  def self.guess_language_for(username)
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
