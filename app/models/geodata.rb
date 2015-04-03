require 'openssl'
require 'geokit'

class Geodata < ActiveRecord::Base
  has_one :market



end