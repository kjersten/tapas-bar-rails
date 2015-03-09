module EpisodeHandler
  def EpisodeHandler.save(feed_item)
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