require "rails_helper"
require "feed_item"

RSpec.describe FeedItem do

  def item_xml(title)
    Nokogiri::XML(%{
    <item>
      <title><![CDATA[#{title}]]></title>
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
  end


  let(:basic_item) { FeedItem.new(item_xml("281 Episode Title")) }
  let(:hyphenated_title_item) { FeedItem.new(item_xml("189-hyphenated-title")) }
  let(:alpha_number_item) { FeedItem.new(item_xml("078b title w/alpha num")) }
  let(:colon_title_item) { FeedItem.new(item_xml("012: title with colon")) }

  it "parses the episode number from a basic title" do
    expect(basic_item.number).to eq("281")
  end

  it "parses the episode title from a basic title" do
    expect(basic_item.title).to eq("Episode Title")
  end

  it "parses the episode number from a hyphenated title" do
    expect(hyphenated_title_item.number).to eq("189")
  end

  it "parses the episode title from a hyphenated title" do
    expect(hyphenated_title_item.title).to eq("hyphenated-title")
  end

  it "parses the episode number from a title with an alphanumeric number" do
    expect(alpha_number_item.number).to eq("078b")
  end

  it "parses the episode title from a title with an alphanumeric number" do
    expect(alpha_number_item.title).to eq("title w/alpha num")
  end

  it "parses the episode number from a title with a colon" do
    expect(colon_title_item.number).to eq("012")
  end

  it "parses the episode title from a title with a colon" do
    expect(colon_title_item.title).to eq("title with colon")
  end

  it "parses the episode description" do
    expect(basic_item.description).to eq("Episode description.")
  end

  it "parses the video url" do
    url = "https://rubytapas.dpdcart.com/feed/download/43998/281-video.mp4"
    expect(basic_item.video_url).to eq(url)
  end
end

