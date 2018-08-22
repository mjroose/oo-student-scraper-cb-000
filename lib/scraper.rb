require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = Nokogiri::HTML(open(index_url))
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
    html = Nokogiri::HTML(open(profile_url))
    {
      :name => html.css('div.vitals-text-container h1.profile-name').text,
      :location => html.css('div.vitals-text-container h2.profile-location').text,
      :twitter => html.css('div.social-icon-container a')[0].attributes['href'].value,
      :linkedin => html.css('div.social-icon-container a')[1].attributes['href'].value,
      :github => html.css('div.social-icon-container a')[2].attributes['href'].value,
      :blog => html.css('div.social-icon-container a')[3].attributes['href'].value,
      :profile_quote => html.css('div.vitals-text-container div.profile-quote').text,
      :bio => html.css('div.description-holder p').text,
      :profile_url => profile_url
    }
  end

end
