require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper


  def self.scrape_index_page(index_url)

    scrapped_students = {}

    doc = Nokogiri::HTML(open(index_url))
    doc.css("div.roster-cards-container")

  end

  def self.scrape_profile_page(profile_url)

  end

end
