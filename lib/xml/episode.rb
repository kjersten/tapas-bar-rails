class Xml::Episode
  attr_accessor :doc

  def initialize(doc)
    @doc = doc
  end

  def number
    title_parts[1]
  end

  def title
    title_parts[2]
  end

  def description
    blog_content.css("p").first.text
  end

  def transcription
    blog_content.inner_html
  end

  def video_url
    doc.css("enclosure").first["url"]
  end

  private

  def full_title
    doc.css("title").text
  end

  def title_parts
    full_title.match(/^([\db]*):?[ -](.*)/)
  end

  def full_description
    doc.css("description").text
  end

  def parsed_description
    Nokogiri::XML(full_description)
  end

  def blog_content
    parsed_description.css(".blog-content").first
  end
end
