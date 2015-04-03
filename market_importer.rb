#TODO: is this needed?
require_relative "app/models/market.rb"

require "json"
require "open-uri"

class MarketImporter
  attr_accessor :data

  def initialize(url)
    @url = url
  end

  def import
    create_markets(parse)
  end

  private

  def parse
    JSON.parse(open("#{@url}").read)
  end

  def create_markets(data)
    markets = data.map do |market_data|
      Market.new(market_data)
    end

    p markets
  end


end

# https://data.cityofnewyork.us/resource/b7kx-qikm.json


# t.string  :borough, null: false
#      t.string  :name, null: false
#      t.string  :street_address, null: false
#      t.string  :days, null: false
#      t.string  :hours, null: false
#      t.integer :distribute_health_bucks, null: false
#      t.integer :accepts_health_bucks, null: false
#      t.integer :ebt, null: false
#      t.integer :stellar, null: false
