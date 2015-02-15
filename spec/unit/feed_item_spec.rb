require "rails_helper"
require "feed_item"

RSpec.describe FeedItem do
  let(:item_xml) { Nokogiri::XML(%{
    <item>
      <title><![CDATA[281 Episode Title]]></title>
      <link>https://rubytapas.dpdcart.com/subscriber/post?id=685</link>
      <description><![CDATA[
        <div class="blog-entry">
            <div class="blog-content">
            <p>a short description</p>
            <p>A complete transcript of the episode</p>
          </div>
        ]]>
      </description>
      <guid isPermaLink="false">
        dpd-7997e0a7fac5b6df0686aa4a37bf95999ed5d1b0
      </guid>
      <pubDate>Thu, 12 Feb 2015 09:00:00 -0500</pubDate>
      <enclosure
        url="https://rubytapas.dpdcart.com/feed/download/43998/281-video.mp4"
        length="54013365" type="video/mp4"/>
      <subtitle>Episode description.</itunes:subtitle>
      <image href="https://getdpd.com/uploads/ruby-tapas.png"/>
    </item>})
  }

  let(:item) { FeedItem.new(item_xml) }

  it "parses the episode number" do
    expect(item.number).to eq("281")
  end

  it "parses the episode title" do
    expect(item.title).to eq("Episode Title")
  end

  it "parses the episode description" do
    expect(item.description).to eq("Episode description.")
  end

  it "parses the video url" do
    url = "https://rubytapas.dpdcart.com/feed/download/43998/281-video.mp4"
    expect(item.video_url).to eq(url)
  end

  it "parses the video name" do
    expect(item.video_name).to eq("281-video.mp4")
  end
end

