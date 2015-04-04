
# Nearest NYC Farmer's Markets

(based on data from [NYC
OpenData](https://data.cityofnewyork.us/Business/2012-NYC-Farmers-Market-List/b7kx-qikm))

### Setup

1. git clone repo
2. `bundle install`
3. `rake db:drop`
4. `rake db:create`
5. `rake db:migrate`
6. `rake db:seed`

Note: seeding may take a few minutes to fetch and process NYC data

### Web App
start Sinatra webserver: `ruby web.rb`

Visit [http://localhost:4567/](http://localhost:4567/)

### Commandline App 
`ruby markets.rb [zipcode]`
