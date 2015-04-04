require_relative 'config/environment.rb'
require "json"
require "open-uri"

class MarketImporter
  attr_accessor :data

  def initialize(url)
    @url = url
  end

  public

  def import
    create_markets(parse)
  end

  private

  def parse
    JSON.parse(open("#{@url}").read)
  end

  def create_markets(data)
    data.map do |market_data|
      market_data["created_at"] = DateTime.now
      market_data["updated_at"] = DateTime.now
      market = Market.new(market_data)

      geoloc = Geokit::Geocoders::GoogleGeocoder.geocode(market.full_address)
      geodata = Geodata.new
      geodata.from_geoloc(geoloc)
      geodata.created_at = DateTime.now
      geodata.updated_at = DateTime.now
      geodata.save
      market.geodata_id = geodata.id
      market.save
      sleep(5)  # to prevent over query limit rejection by Google
    end
  end

end

# markets = MarketImporter.new("https://data.cityofnewyork.us/resource/b7kx-qikm.json")
# markets.import
