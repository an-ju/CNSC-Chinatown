# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

points = [{:name => "Old St. Mary's Cathedral", :address => '660 California St.', :description => 'First Asian church in North America', :category => 'Historical'},
          {:name => "Tianhou Temple", :address => '125 Waverly Place', :description => 'Oldest Buddhist temple in the US', :category => 'Historical'},
          {:name => "Dragon's Gate", :address => 'Bush St. & Grant Ave.', :description => 'Only authentic Chinatown Gate in North America', :category => 'Attraction'},
          {:name => "Hong Kong Clay Pot Restaurant", :address => '960 Grant Ave.', :description => 'Chinese clay pot lunch & dinner spot', :category => 'Dining'},
          {:name => "Hunan Home's Restaurant", :address => '622 Jackson St.', :description => 'Family owned Chinese cooking with booths', :category => 'Dining'},
          {:name => "Good Mong Kok Bakery", :address => '1039 Stockton St.', :description => 'Homemade dim sum and baked goods', :category => 'Dining'}
    ]

points.each do |pt|
  Point.create!(pt)
end