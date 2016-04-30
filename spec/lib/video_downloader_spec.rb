require "rails_helper"
require "fetch"
require "video_downloader"

RSpec.describe VideoDownloader do
  let(:episode) { Episode.new(
      remote_video_url: "https://test.com/sample_video",
      number: "1",
      description: "whatever",
      title: "generic title"
    )
  }
  let(:downloader) { VideoDownloader.new }
  let(:video) { File.new("spec/fixtures/files/video.mp4") }

  after :each do
    episode.video.destroy
  end

  it "downloads the episode's video" do
    expect(downloader).to receive(:fetch).with(episode.remote_video_url) { video }
    downloader.download(episode)
  end

  it "associates the downloaded video with the episode" do
    allow(downloader).to receive(:fetch) { video }

    downloader.download(episode)

    expect(episode.video).to exist
  end

  it "creates the video name based on episode metadata" do
    allow(downloader).to receive(:fetch) { video }

    downloader.download(episode)

    expect(episode.video_file_name).to eq("1 - generic title.mp4")
  end
end
