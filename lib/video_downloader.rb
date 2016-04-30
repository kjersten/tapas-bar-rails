class VideoDownloader
  include Fetch

  def download(episode)
    video_file = fetch(episode.remote_video_url)

    episode.update!(
      video: video_file,
      video_file_name: "#{episode.number} - #{episode.title}.mp4"
    )
  end
end
