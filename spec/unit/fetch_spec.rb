require "rails_helper"
require "fetch"

RSpec.describe Fetch do
  let(:dummy_object) { Object.new.extend(Fetch) }

  it "authenticate and fetch data from Ruby Tapas" do
    VCR.use_cassette('feed') do
      response = dummy_object.fetch("feed")
      expect(response).to start_with("<?xml")
    end
  end
end
