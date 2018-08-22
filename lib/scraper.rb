require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = Nokogiri::HTML(open('./fixtures/student-site/index.html'))
    profile_links = html.css('div.student-card a')
    profile_links.collect do |profile_link|
      {
        :name => profile_link.css('h4.student-name').text,
        :location => profile_link.css('p.student-location').text,
        :profile_url => profile_link.attributes['href'].value
      }
    end
  end

  def self.scrape_profile_page(profile_url)

  end

end
