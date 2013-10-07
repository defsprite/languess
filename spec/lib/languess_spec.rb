require 'spec_helper'

describe Languess do

  let(:languess) { Languess.new }

  context "#get_language_for", :vcr do

    it "returns a guess for the programming language for the given user" do
      result = languess.guess_language_for("rails")
      result.should eql("Ruby")
    end

    it "raises an error if an empty username is given" do
      expect { languess.guess_language_for("") }.to raise_error(ArgumentError)
    end

    it "raises an error if no username is given" do
      expect { languess.guess_language_for(nil) }.to raise_error(ArgumentError)
    end

    it "raises a Languess::Error in case of an error" do
      stub_request(:get, /api\.github\.com/).to_return(:status => 409)

      expect { languess.guess_language_for("some_user") }.to raise_error(Languess::Error)
    end

  end

end
