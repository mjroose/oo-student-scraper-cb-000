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

    student_data = {
      :profile_quote => html.css('div.vitals-text-container div.profile-quote').text,
      :bio => html.css('div.description-holder p').text
    }

    social_links = html.css('div.social-icon-container a').collect { |link| link.attributes['href'].value }
    social_kv_pairs = social_links.collect do |link|
      if link.include? "twitter.com"
        student_data[:twitter] = link
      elsif link.include? "linkedin.com"
        student_data[:linkedin] = link
      elsif link.include? "github.com"
        student_data[:github] = link
      else
        student_data[:blog] = link
      end
    end


  end

end
