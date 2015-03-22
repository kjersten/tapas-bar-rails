FactoryGirl.define do
  factory :episode do
    sequence(:number)
    title  "Sample RubyTapas Video"
    description "This video explains something."
    remote_video_url "https://example.com/video"
  end
end
