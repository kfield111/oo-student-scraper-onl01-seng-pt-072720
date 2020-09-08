require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper


  def self.scrape_index_page(index_url)

    doc = Nokogiri::HTML(open(index_url))
    binding.pry

    scraped_students = {}

    doc.CSS("div.roster-cards-container").each do |temp|
        scraped_students[temp] = {}
      end
      scraped_students
  end

  def self.scrape_profile_page(profile_url)

  end

end
