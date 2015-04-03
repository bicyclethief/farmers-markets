#TODO: is this needed?
require_relative "app/models/market.rb"

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

  # TODO: create geodata objects
  def create_markets(data)
    data.map do |market_data|
      Market.create(market_data)
    end
  end

end

markets = MarketImporter.new("https://data.cityofnewyork.us/resource/b7kx-qikm.json")
markets.import
