require 'spec_helper'

describe Languess do

  let(:languess) { Languess.new }

  context "#get_language_for" do

    it "returns a guess for the programming language for the given user" do
      languess.guess_language_for("rails").should eql("Ruby")
    end

    it "raises an error if an empty username is given" do
      expect { languess.guess_language_for("") }.to raise_error(ArgumentError)
    end

    it "raises an error if no username is given" do
      expect { languess.guess_language_for(nil) }.to raise_error(ArgumentError)
    end

  end


end
