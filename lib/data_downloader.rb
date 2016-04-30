class DataDownloader
  include Fetch

  FEED_URL = "https://rubytapas.dpdcart.com/feed"

  def download(episode_number = nil)
    episodes = all_available_episodes

    if episode_number
      episodes = episodes.find_all { |ep| ep.number.to_i == episode_number.to_i }
    end

    episodes.each do |episode|
      EpisodeHandler.save(episode)
    end
  end

  private

  def all_available_episodes
    episode_list = fetch(FEED_URL)

    Xml::Feed.new(episode_list.read).episodes
  end
end
