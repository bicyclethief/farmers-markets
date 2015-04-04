
# Nearest NYC Farmer's Markets

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

![form
screenshot](https://github.com/bicyclethief/farmers-markets/blob/master/images/form.png "Form page")

![result
screenshot](https://github.com/bicyclethief/farmers-markets/blob/master/images/nearest.png "Results page")

### Commandline App 
`ruby markets.rb [zipcode]`
