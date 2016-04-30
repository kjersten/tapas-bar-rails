require "rails_helper"
require "episode_handler"

RSpec.describe EpisodeHandler do
  let(:item_num) { 1 }
  let(:item) { instance_double("Xml::Episode",
                number: item_num,
                title: "a title",
                description: "a description",
                transcription: "some text",
                video_url: "a url")
              }

  it "creates a new episode if the item is not yet in the db" do
    allow_any_instance_of(VideoDownloader).to receive(:download)

    EpisodeHandler.save(item)

    matching_episodes = Episode.where(number: item_num)
    expect(matching_episodes.count).to eq(1)
    expect(matching_episodes.first.title).to eq("a title")
  end

  it "downloads the video if the item is not yet in the db" do
    expect_any_instance_of(VideoDownloader).to receive(:download)

    EpisodeHandler.save(item)
  end

  it "ignores the episode if the item is already in the db" do
    Episode.create!(
      number: item_num,
      title: "pre-existing record",
      description: "a description",
      remote_video_url: "any string"
    )

    EpisodeHandler.save(item)

    matching_episodes = Episode.where(number: item_num)
    expect(matching_episodes.count).to eq(1)
    expect(matching_episodes.first.title).to eq("pre-existing record")
  end
end
