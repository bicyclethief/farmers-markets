# require 'openssl'
# require 'geokit'

class Market < ActiveRecord::Base
  # belongs_to :geodata

  # TODO: validate data

  # def nearest_market(zipcode, num)
  #   distance_markets = {}

  #   user_geodata = Geokit::Geocoders::GoogleGeocoder.geocode(zipcode)
  #   Market.all.each do |market|
  #     city_state = "#{market.borough, market.state_code}"
  #     full_address = "#{market.street_address} #{city_state}"
  #     market_geodata = Geokit::Geocoders::GoogleGeocoder.geocode(full_address)
  #     distance = user_geodata.distance_to(market_geodata)
  #     distance_markets[distance] = market
  #   end

  #   closest_distances = distance_markets.keys.sort.first(num)

  #   closest_distances.map do |key|
  #     distance_markets[key]
  #   end
  # end

end
