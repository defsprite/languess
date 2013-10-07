require 'spec_helper'

describe Languess::GithubAPI do

  let(:api) { Languess::GithubAPI.new }

  describe "#get_user_repos", :vcr do

    it "gets the list of repositories for a given user" do
      repositories = api.get_user_repos("defsprite")
      repositories.should_not be_empty
    end

    it "retrieves repositories with language information" do
      repositories = api.get_user_repos("defsprite")
      repositories.first.should have_key("language")
    end

    it "raises an error if the user cannot be found" do
      expect { api.get_user_repos("nonexistentusername12345678910") }.to raise_error(Languess::GithubAPI::Error)
    end

    it "raises an error if something goes wrong during the API call" do
      stub_request(:get, /api\.github\.com/).to_timeout

      expect { api.get_user_repos("rails") }.to raise_error(Languess::GithubAPI::Error)
    end

    it "raises an error if the response code other than success" do
      stub_request(:get, /api\.github\.com/).to_return(:status => 409)

      expect { api.get_user_repos("rails") }.to raise_error(Languess::GithubAPI::Error)
    end

  end


end
