
class Controller
  def initialize

  end

  # case statement?

  def run(command)
    display(query(command))
  end

  def query(zip_code_input)
    nearest_markets = []
    # use geodata to return 3 nearest markets
    return nearest_markets
  end

  def display(market)
    puts "Nearest farmer's markets:"
    puts "1.) #{market.market_name}"
    puts "#{market.full_address}"
    puts "#{market.borough}, NY, #{market.zip}"
    puts "Open: #{market.days_s} #{market.hours}"
  end

end

command = ARGV[0]

market_finder = Controller.new
market_finder.run(command)
