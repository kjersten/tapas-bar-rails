class FeedItem
  attr_accessor :doc

  def initialize(doc)
    @doc = doc
  end

  def number
    title_parts[1].to_i
  end

  def title
    title_parts[2]
  end

  def description
    doc.css("subtitle").text
  end

  def video_url
    doc.css("enclosure").first["url"]
  end

  private

  def full_title
    doc.css("title").text
  end

  def title_parts
    full_title.match(/^(\d*) (.*)/)
  end
end
