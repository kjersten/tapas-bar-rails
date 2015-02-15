namespace :download do
  desc "Download information about new episodes"
  task episodes: :environment do
    EpisodeDownloader.new.download
  end
end
