require_relative 'config/environment'
require 'sinatra'


get '/' do
  @title = "Nearest Farmer's Markets"
  erb :index
end

post '/nearest' do
  @zipcode = params['zipcode']
  @num_markets = 3
  @distance_markets = Market.nearest_market(@zipcode, @num_markets)
  erb :nearest
end
