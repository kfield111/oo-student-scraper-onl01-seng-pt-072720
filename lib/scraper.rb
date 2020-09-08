require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper


  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(index_url)

    scraped_students = {}

    doc.CSS("div.roster-cards-container")
  end

  def self.scrape_profile_page(profile_url)

  end

end
