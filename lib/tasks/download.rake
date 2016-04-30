namespace :download do
  desc "Download information about new episodes"
  task :episodes, [:ep_number] => :environment do |t, args|
    DataDownloader.new.download(args[:ep_number])
  end
end
