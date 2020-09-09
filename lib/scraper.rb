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



    profile_page = Nokogiri::HTML(open(profile_url))
    social_media_hrefs = profile_page.css("div.social-icon-container a").map {|link| link['href']}

    social_media_hrefs.each do |temp|
      if temp.include?("twitter")
        student[:twitter] = temp
      elsif temp.include?("linkedin")
        student[:linkedin] = temp
      elsif temp.include?("github")
        student[:github] = temp
      else
        student[:blog] = temp
      end


    #need to dynamically add social media key name and associated href value rather than hard coding in keys for the hash

      student_info = {profile_quote: profile_page.css('div.profile-quote').text, bio: profile_page.css("div.description-holder p").text}
  end

end
