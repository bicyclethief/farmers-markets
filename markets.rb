require_relative 'config/environment'

class Controller
  attr_reader :view

  def initialize
    @view = View.new
  end

  def run(argv)
    if argv.empty?
      view.display_usage
      return
    end

    user_input = argv.first
    if ! zipcode?(user_input)
      view.display_bad_zip
      return
    end

    num_markets = 3
    output = "#{num_markets} Nearest Farmers Markets:\n\n"

    distance_markets = Market.nearest_market(user_input, num_markets)
    distance_markets.each_with_index do |distance_market, index|
      distance = distance_market[0]
      market = distance_market[1]
      output += "#{index+1}) #{format_distance(distance)} miles away\n"
      output += "   #{market.market_name}\n"
      output += "   #{market.street_address}\n"
      output += "   #{market.borough}, #{market.geodata.state_code} #{market.geodata.zip}\n"
      output += "   Open: #{market.day_s} #{market.hours}\n\n"
    end

    view.display_markets(output)
  end

  private

  def format_distance(distance)
    sprintf("%0.2f", distance)
  end

  def zipcode?(input)
    return false if input.length != 5
    input =~ /\d{5}/
  end
end

class View
  def display_usage
    puts "\nUsage: ruby markets.rb [zip code]\n\n"
  end 

  def display_bad_zip
    puts "Please input a valid zip code."
  end

  def display_markets(markets)
    puts markets
  end

  # def display
  #   puts "Nearest farmer's markets:"
  #   puts
  #   puts "#{market.market_name}"
  #   puts "----------"
  #   puts "#{market.full_address}"
  #   puts "#{market.borough}, NY, #{market.zip}"
  #   puts "Open: #{market.days_s} #{market.hours}"
  # end
end

market_finder = Controller.new
market_finder.run(ARGV)
