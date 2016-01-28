namespace :daily_seed do
  desc "Delete all events from database"
  task delete_events: :environment do
    Event.all.each { |event| event.delete }
  end

  desc "Populate database with events from the current day"
  task generate_events: :environment do
    include ApplicationHelper
    iterate_through_links_to_generate_content
  end

  desc "Delete all events and seed with new daily data"
  task reset: :environment do
    include ApplicationHelper
    Event.all.each { |event| event.delete }
    iterate_through_links_to_generate_content
  end

end
