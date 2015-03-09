class DataDownloader
  include Fetch

  FEED_URL = "https://rubytapas.dpdcart.com/feed"

  def download
    response_file = fetch(FEED_URL)

    Xml::Feed.new(response_file.read).episodes.each do |episode|
      EpisodeHandler.save(episode)
    end
  end
end
