require "rails_helper"

RSpec.describe Episode do
  it "is is unwatched by default" do
    episode = Episode.new

    expect(episode.watched?).to eq(false)
  end
end
