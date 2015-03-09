require "rails_helper"
require "xml/feed"

RSpec.describe Xml::Feed do
  let(:feed_xml) { %{
    <?xml version="1.0" encoding="UTF-8"?>
    <rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" version="2.0">
      <channel>
        <title>RubyTapas</title>
        <link>https://rubytapas.dpdcart.com/subscriber/content</link>
        <itunes:summary>RubyTapas: Small plates of gourmet code.</itunes:summary>
        <itunes:image href="https://getdpd.com/uploads/ruby-tapas.png"/>
        <item>
          <title><![CDATA[281 Splatted Send]]></title>
        </item>
        <item>
          <title><![CDATA[280 Itself]]></title>
        </item>
      </channel>
    </rss>
    } }

  it "parses an array of episodes" do
    feed = Xml::Feed.new(feed_xml)
    expect(feed.episodes.count).to eq(2)
  end
end

