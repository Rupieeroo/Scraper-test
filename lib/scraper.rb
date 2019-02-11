require 'HTTParty'
require 'Nokogiri'

class Scraper

  doc = HTTParty.get("https://store.nike.com/gb/en_gb/pw/mens-nikeid-lifestyle-shoes/1k9Z7puZoneZoi3?ref=https%253A%252F%252Fwww.google.com%252F")
  @parse_page ||= Nokogiri::HTML(doc)
  def hello
    return "Hello World"
  end

end
