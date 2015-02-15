class EpisodeDownloader
  include Fetch

  def download
    feed_xml = fetch("feed")

    Feed.new(feed_xml).items.each do |item|
      ItemHandler.new(item).handle
    end
  end
end
