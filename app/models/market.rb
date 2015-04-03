class Market < ActiveRecord::Base
  belongs_to :geodata

  # TODO: validate data

  def Market.nearest_market(zipcode, num)
    distance_markets = {}
    user_geodata = Geokit::Geocoders::GoogleGeocoder.geocode(zipcode)
    Market.all.each do |market|
      market_geodata = Geokit::Geocoders::GoogleGeocoder.geocode("#{market.street_address} #{market.borough}, NY")
      distance = user_geodata.distance_to(market_geodata)
      distance_markets[distance] = market
    end

    closest_distances = distance_markets.keys.sort.first(num)

    closest_distances.map do |key|
      distance_markets[key]
    end
  end

end

