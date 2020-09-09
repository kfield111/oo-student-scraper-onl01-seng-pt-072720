class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    @name = student_hash[:name]
    @location = student_hash[:location]
    @profile_quote = student_hash[:profile_quote]
    @bio = student_hash[:bio]
    @profile_url = student_hash[:profile_url]
    @@all << self
  end

  def self.create_from_collection(students_array)
   students_array.map
  end

  def add_student_attributes(attributes_hash)
    Scraper.scrape_profile_page(profile_url)
    student_info[:bio] = attributes_hash
  end

  def self.all
    @@all
  end
end
