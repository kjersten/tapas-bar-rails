class Episode < ActiveRecord::Base
  has_attached_file :video, {
      path: "public/:attachment/:hash.:extension",
      hash_secret: Rails.application.secrets.video_attachment_secret
    }

  validates_attachment :video, content_type: { content_type: "video/mp4" }
end
