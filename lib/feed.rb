class Feed
  attr_accessor :doc

  def initialize(xml)
    @doc = Nokogiri::XML(xml)
    doc.remove_namespaces!
  end

  def items
    doc.css("item").map { |item_xml| FeedItem.new(item_xml) }
  end
end
