include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :episode do
    sequence(:number)
    title  "Sample RubyTapas Video"
    description "This video explains something."
    remote_video_url "https://example.com/video"

    trait :with_video do
      video { fixture_file_upload(Rails.root.join("spec", "fixtures", "files", "video.mp4"), "video/mp4") }
    end
  end
end
