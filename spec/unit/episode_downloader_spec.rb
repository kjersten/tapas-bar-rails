require "rails_helper"
require "fetch"
require "feed"
require "item_handler"
require "episode_downloader"

RSpec.describe EpisodeDownloader do
  let(:downloader) { EpisodeDownloader.new }

  it "calls fetch to download the feed from Ruby Tapas" do
    expect(downloader).to receive(:fetch).with("feed")
    downloader.download
  end

  it "converts the feed into a list of items" do
    allow(downloader).to receive(:fetch)

    expect_any_instance_of(Feed).to receive(:items) { [] }
    downloader.download
  end

  it "passes each item to an item handler" do
    allow(downloader).to receive(:fetch)
    item = double("item")
    allow_any_instance_of(Feed).to receive(:items) { [item] }

    expect_any_instance_of(ItemHandler).to receive(:handle)
    downloader.download
  end
end
