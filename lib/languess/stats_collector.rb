module Languess
  class StatsCollector

    def initialize(api_client = GithubAPI.new)
      @api = api_client
    end


    def collect_stats_for(username)
      language_stats = @api.get_user_repos(username).inject({}) do |hash, element|
        language       = element['language']
        hash[language] ||= 0
        hash[language] += 1
        hash
      end
      language_stats.sort_by { |key, value| value }.reverse
    end

  end
end
