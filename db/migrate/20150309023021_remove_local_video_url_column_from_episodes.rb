class RemoveLocalVideoUrlColumnFromEpisodes < ActiveRecord::Migration
  def change
    remove_column :episodes, :local_video_url, :string
  end
end
