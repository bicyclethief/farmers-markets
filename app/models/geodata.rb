require 'openssl'
require 'geokit'

class Geodata < ActiveRecord::Base
  has_one :market

  def from_geoloc(geoloc)
    self.street_address = geoloc.street_address
    self.city = geoloc.city
    self.state_code = geoloc.state_code
    self.state_name = geoloc.state_name
    self.zip = geoloc.zip
    self.country_code = geoloc.country_code
    self.province = geoloc.province
    self.full_address = geoloc.province
    self.lat = geoloc.lat
    self.lng = geoloc.lng
    self.neighborhood = geoloc.neighborhood
    self.district = geoloc.district
    self.country = geoloc.country
  end



end
