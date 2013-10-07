require 'spec_helper'

describe Languess::StatsCollector do

  context "#collect_stats_for" do

    it "counts the occurrences for each language" do
      api_client = double("GithubAPI", :get_user_repos => [{"language" => nil}, {"language" => "Ruby"}, {"language" => "Ruby"}, {"language" => "Ruby"}, {"language" => "JavaScript"}, {"language" => "JavaScript"}, {"language" => "Haskell"}])
      stats_collector = Languess::StatsCollector.new(api_client)

      result = stats_collector.collect_stats_for("defsprite")
      result.should eql([["Ruby", 3], ["JavaScript", 2], ["Haskell", 1], [nil, 1]])
    end

    it "calls get_user_repos on the api client with the given username" do
      api_client = double("GithubAPI")
      api_client.should receive(:get_user_repos).with("defsprite").and_return([])

      stats_collector = Languess::StatsCollector.new(api_client)
      stats_collector.collect_stats_for("defsprite")
    end

  end

end
