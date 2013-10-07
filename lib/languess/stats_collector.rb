module Languess
  class StatsCollector

    def initialize(api_client)
      @api = api_client
    end


    def collect_stats_for(username)
      language_stats = @api.get_user_repos(username).inject(Hash.new(0)) do |hash, element|
        hash[element['language']] += 1
        hash
      end
      language_stats.sort_by { |key, value| value }.reverse
    end

  end
end
