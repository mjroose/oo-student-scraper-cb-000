require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = Nokogiri::HTML('../fixtures/student-site/index.html')
    # cards = 
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
