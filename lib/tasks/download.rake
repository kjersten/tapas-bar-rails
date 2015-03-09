namespace :download do
  desc "Download information about new episodes"
  task episodes: :environment do
    DataDownloader.new.download
  end
end
