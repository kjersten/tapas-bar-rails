class AddVideoColumnsToEpisodes < ActiveRecord::Migration
  def up
    add_attachment :episodes, :video
  end

  def down
    remove_attachment :episodes, :video
  end
end
