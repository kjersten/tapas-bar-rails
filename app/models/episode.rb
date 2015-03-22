class Episode < ActiveRecord::Base

  validates_presence_of :number, :title, :description, :remote_video_url

  has_attached_file :video, {
      path: "public/:attachment/:hash.:extension",
      hash_secret: Rails.application.secrets.video_attachment_secret
    }

  validates_attachment :video, content_type: { content_type: "video/mp4" }
end
