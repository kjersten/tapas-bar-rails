class AddTextColumnToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :transcription, :text
  end
end
