class Xml::Feed
  attr_accessor :doc

  def initialize(xml)
    @doc = Nokogiri::XML(xml)
    doc.remove_namespaces!
  end

  def episodes
    doc.css("item").map { |item_xml| Xml::Episode.new(item_xml) }
  end
end
