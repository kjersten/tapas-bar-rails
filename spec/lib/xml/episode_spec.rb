require "rails_helper"
require "xml/episode"

RSpec.describe Xml::Episode do

  def item_xml(title)
    Nokogiri::XML(%{
      <item>
        <title><![CDATA[#{title}]]></title>
        <link>https://rubytapas.dpdcart.com/subscriber/post?id=18</link>
        <description><![CDATA[<div class="blog-entry">
          <div class="blog-content"><p>First paragraph in blog content div.</p><p>Second paragraph of blog content.</p></div>
          <h3>Attached Files</h3>
          <ul>
            <li><a href="https://rubytapas.dpdcart.com/subscriber/download?file_id=25">RubyTapas001.mp4</a></li>
            <li><a href="https://rubytapas.dpdcart.com/subscriber/download?file_id=26">001-binary-literals.html</a></li>
            <li><a href="https://rubytapas.dpdcart.com/subscriber/download?file_id=27">001-binary-literals.rb</a></li>
          </ul></div>]]>
        </description>
        <guid isPermaLink="false">dpd-89e8004c8242e7ad548833bef1e18a5b575c92c1</guid>
        <pubDate>Mon, 24 Sep 2012 09:00:00 -0400</pubDate>
        <enclosure url="https://rubytapas.dpdcart.com/feed/download/25/RubyTapas001.mp4" length="12502397" type="video/mp4"/>
        <image href="https://getdpd.com/uploads/ruby-tapas.png"/>
      </item>
    })
  end


  let(:basic_item) { Xml::Episode.new(item_xml("281 Episode Title")) }
  let(:hyphenated_title_item) { Xml::Episode.new(item_xml("189-hyphenated-title")) }
  let(:alpha_number_item) { Xml::Episode.new(item_xml("078b title w/alpha num")) }
  let(:colon_title_item) { Xml::Episode.new(item_xml("012: title with colon")) }

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
    expect(basic_item.description).to eq("First paragraph in blog content div.")
  end

  it "parses the video url" do
    url = "https://rubytapas.dpdcart.com/feed/download/25/RubyTapas001.mp4"
    expect(basic_item.video_url).to eq(url)
  end
end

