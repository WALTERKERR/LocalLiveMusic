require 'nokogiri'
require 'open-uri'

module ApplicationHelper

  def find_content_to_parse
    base_url = "http://www.sfweekly.com/sanfrancisco/EventSearch?eventSection=2205482"
    data_to_parse = Nokogiri::HTML(open(base_url))
    data_to_parse.at("thead").search("a")
  end

  def iterate_to_generate_array_of_event_links
    raw_array_of_urls = []
    find_content_to_parse.each do |nokogiri_element|
      item = nokogiri_element.attributes["href"].value
      raw_array_of_urls << item
    end
    more_polished_array = raw_array_of_urls.select.each_with_index { |_, i| i.even? }
    more_polished_array.slice!(0)
    more_polished_array.slice!(0)
    more_polished_array
  end

  def scrape_from_event(link)
    base_url = "http://www.sfweekly.com#{link}"
    webpage_to_parse = Nokogiri::HTML(open(base_url, 'User-Agent' => 'firefox'))
    venue_name = webpage_to_parse.at_css('.org').text
    locality = webpage_to_parse.at_css('.locality').text
    address = webpage_to_parse.at_css('.street-address').text.strip + ", " + locality + " CA"
    venue_desc = webpage_to_parse.at_css('#LocationDescription').text.strip if webpage_to_parse.at_css('#LocationDescription')
    p event_name = webpage_to_parse.at_css('#UpcomingEvents').at_css('.eventItem').at('h4').text.delete("\n").delete("\r").strip
    p event_date = webpage_to_parse.at_css('#UpcomingEvents').at_css('.eventItem').at('ul').text.strip
    if event_date.match(/\./)
      chomped_event = event_date.split(' ')[1].gsub(".","")+event_date.split(' ')[2].chop
      chomped_event = event_date
    end
    p today_date = Date.today.strftime("%b%e")
    chomped_time = grabTime(event_date)
    # chomped_time = "8pm"
    if today_date == chomped_event
      Event.create(event_name: event_name, venue_name: venue_name, address: address, venue_desc: venue_desc, event_time: chomped_time)
    else
      Event.create(event_name: "Live Music", venue_name: venue_name, address: address, venue_desc: venue_desc, event_time: chomped_time)
    end
  end

  # p iterate_to_generate_array_of_event_links

  # scrape_from_event("/sanfrancisco/great-american-music-hall/Location?oid=2191507")

  def iterate_through_links_to_generate_content
    iterate_to_generate_array_of_event_links.each do |link|
      p link
      unless link.empty?
      # unless link == nil
        scrape_from_event(link)
      end
    # end
    end
  end

# scrape_from_event

  # iterate_through_links_to_generate_content
  # p iterate_to_generate_array_of_event_links

  def grabTime(str)
    if /(\,\s)(\d.+\.\m\.)/.match(str)
      /(\,\s)(\d.+\.\m\.)/.match(str)[2]
    else
      "Ongoing"
    end
  end

end
