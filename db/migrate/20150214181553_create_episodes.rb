class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :number
      t.string :title
      t.text :description
      t.string :remote_video_url
      t.string :local_video_url
      t.boolean :watched, default: false

      t.timestamps
    end
  end
end
