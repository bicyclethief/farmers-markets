class Market < ActiveRecord::Base
  belongs_to :geodata

  # TODO: validate data
  
  def full_address
    "#{street_address} #{borough}, NY"
  end

  def self.nearest_market(zipcode, num)
    distance_markets = {}
    user_geodata = Geokit::Geocoders::GoogleGeocoder.geocode(zipcode)

    Market.all.each do |market|
      market_geodata = market.geodata
      distance = GeoDistance::Haversine.geo_distance(user_geodata.lat.to_f,
                                                     user_geodata.lng.to_f,
                                                     market_geodata.lat.to_f,
                                                     market_geodata.lng.to_f)
      distance_markets[distance.miles] = market
    end

    closest_distances = distance_markets.keys.sort.first(num)

    closest_distances.map do |distance|
      market = distance_markets[distance]
      [distance, market]
    end
  end

end

