require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper


  def self.scrape_index_page(index_url)

    scrapped_students = []


    doc = Nokogiri::HTML(open(index_url))
    doc.css("div.student-card").each do |temp|
      student = {}
      student = {name: temp.css("h4.student-name").text, location: temp.css("p.student-location").text, profile_url: temp.css("a").first["href"]}
      scrapped_students << student
    end
    scrapped_students
  end

  def self.scrape_profile_page(profile_url)

    student_info = {}

    profile_page = Nokogiri::HTML(open(profile_url))
    profile_page.css("div.details-container").each do |temp|
      student_info = {twitter: temp.css("div.social-icon-container a")[0]["href"], biography: temp.css("div.description-holder p").text}
      end
      student_info
  end

end
