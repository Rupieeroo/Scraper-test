require 'HTTParty'
require 'Nokogiri'

class Scraper

  attr_accessor :parse_page

  def initialize
    doc = HTTParty.get("https://store.nike.com/gb/en_gb/pw/mens-nikeid-lifestyle-shoes/1k9Z7puZoneZoi3?ref=https%253A%252F%252Fwww.google.com%252F")
    @parse_page ||= Nokogiri::HTML(doc)
  end

  def get_names
    item_container.css(".product-display-name").css("p").children.map { |name| name.text }.compact
  end

  def get_prices
    item_container.css(".product-price").css("span.local").children.map { |price| price.text }.compact
  end

  def hello
    return "Hello World"
  end

  private

  def item_container
    parse_page.css(".grid-item-info")
  end

  scraper = Scraper.new
  names = scraper.get_names
  prices = scraper.get_prices

  (0...prices.size).each do |index|
    puts " - - - Index #{index + 1} - - -"
    puts "Name: #{names[index]} | Price: #{prices[index]}"
  end

end
