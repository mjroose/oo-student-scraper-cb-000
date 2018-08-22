require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = Nokogiri::HTML(open('./fixtures/student-site/index.html'))
    binding.pry
    profile_links = html.css('div.student-card a').attributes['href'].value
    profile_links
  end

  def self.scrape_profile_page(profile_url)

  end

end
