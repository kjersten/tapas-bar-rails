require "rails_helper"
require "fetch"
require "data_downloader"

RSpec.describe Fetch do
  let(:fetching_object) { Object.new.extend(Fetch) }

  it "authenticates and fetchs a page from Ruby Tapas" do
    VCR.use_cassette("feed") do
      response_file = fetching_object.fetch(DataDownloader::FEED_URL)
      expect(response_file.read).to start_with("<?xml")
    end
  end
end
