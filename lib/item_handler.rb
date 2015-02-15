class ItemHandler
  attr_accessor :feed_item

  def initialize(feed_item)
    @feed_item = feed_item
  end

  def handle
    puts feed_item.video_url
    episode = Episode.find_by_number(feed_item.number)
    unless episode.present?
      Episode.create(
        number: feed_item.number,
        title: feed_item.title,
        description: feed_item.description,
        remote_video_url: feed_item.video_url
      )
    end
  end
end
