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
    social_media_hrefs = profile_page.css("div.social-icon-container a").map {|link| link['href']}

    profile_page.css("div.details-container").each do |temp|
      student_info = {twitter: social_media_hrefs[0], linkedin: social_media_hrefs[1], github: social_media_hrefs[2], blog: social_media_hrefs[3],
      profile_quote: temp.css('div.profile-quote').text, bio: temp.css("div.description-holder p").text}
      end
      student_info
  end

end
