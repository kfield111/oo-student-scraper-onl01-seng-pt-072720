require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper


  def self.scrape_index_page(index_url)

    scrapped_students = []
    student = {}

    doc = Nokogiri::HTML(open(index_url))
    doc.css("div.roster-cards-container").each do |temp|
      student = temp.css("div.card-text-container")
      





      scrapped_students << student
    end
    scrapped_students
  end

  def self.scrape_profile_page(profile_url)

  end

end
