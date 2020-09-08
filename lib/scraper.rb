require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper


  def self.scrape_index_page(index_url)

    html = index_url

    doc = Nokogiri::HTML(html)

    scraped_students = {}

    doc.CSS("div.roster-cards-container").each do |temp|
        scraped_students[temp] = {}
      end
  end

  def self.scrape_profile_page(profile_url)

  end

end
