require 'web_spec_helper'

describe "The mini web frontend" do

  context "GET /" do

    it "renders sucessfully" do
      get '/'

      last_response.should be_ok
    end

  end

  context "POST /languess" do

    it "shows the result from the Languess lib" do
      Languess.should_receive(:guess_language_for).with("defsprite").and_return("Omikron Basic")

      post '/languess', :username => "defsprite"

      last_response.should be_ok
      last_response.body.should =~ /Omikron Basic/
    end

    it "renders the error template in case of an error" do
      Languess.stub(:guess_language_for).and_raise(Languess::GithubAPI::Error.new("BOOM!"))

      post '/languess', :username => "some_user"

      last_response.should be_ok
      last_response.body.should =~ /we could not find this user/
    end

    it 'responds with not_found when no username is given' do
      post '/languess'

      last_response.status.should eql(404)
    end

  end

  context "fully integrated", :vcr do

    it "shows 'Ruby' for the user 'rails'" do
      post '/languess', :username => "rails"

      last_response.should be_ok
      last_response.body.should =~ /Ruby/
    end

  end

end
