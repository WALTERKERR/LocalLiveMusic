require 'nokogiri'
require 'open-uri'
# module ApplicationHelper

  def find_content_to_parse
    # base_url = "http://www.sfweekly.com/sanfrancisco/EventSearch?eventSection=2205482"
    base_url = "/Users/apprentice/Desktop/ShowsNearMe/public/link_template.html"
    data_to_parse = Nokogiri::HTML(open(base_url))
    data_to_parse.at("thead").search("a")
  end

  def iterate_through_content
    raw_array_of_urls = []
    find_content_to_parse.each do |nokogiri_element|
      item = nokogiri_element.attributes["href"].value
      raw_array_of_urls << item
    end
    raw_array_of_urls.select.each_with_index { |_, i| i.even? }.last
  end

  def scrape_from_event



  end




  p iterate_through_content


# end
