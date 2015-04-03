
class Controller

  def run(command)
    query(command).each do |market|
      display(market)
    end
  end

  def query(zip_code_input)
    nearest_markets = []
    # use geokit to return 3 nearest markets
    return nearest_markets
  end

  def display

    puts "Nearest farmer's markets:"
    puts
    puts "Bissel Gardens Farmers' Market"
    puts "--------"
    puts "Baychester Ave & E 241st St, Bronx, NY"
    puts "Bronx, NY, 11207"
    puts "Open: Wednesday & Saturday, 9am-5pm"
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

command = ARGV[0]

market_finder = Controller.new
market_finder.display
