require "rails_helper"
require "fetch"
require "xml/feed"
require "xml/episode"
require "episode_handler"
require "data_downloader"

RSpec.describe DataDownloader do
  it "creates an episode record for each item in the feed" do
    allow_any_instance_of(VideoDownloader).to receive(:download)
    downloader = DataDownloader.new

    VCR.use_cassette("feed") do
      downloader.download
    end

    expect(Episode.count).to eq(1)
  end
end
