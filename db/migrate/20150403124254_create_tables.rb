class CreateTables < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string  :borough, null: false
      t.string  :market_name, null: false
      t.string  :street_address, null: false
      t.string  :day_s, null: false
      t.string  :hours, null: false
      t.integer :distribute_health_bucks, null: false
      t.integer :accepts_health_bucks, null: false
      t.integer :ebt, null: false
      t.integer :stellar, null: false
      t.integer :geodata_id

      t.timestamps null: false
    end

    create_table :geodata do |t|
      t.string    :street_address
      t.string    :city
      t.string    :state_code
      t.string    :state_name
      t.string    :zip
      t.string    :country_code
      t.string    :province
      t.string    :full_address
      t.decimal   :lat, null: false
      t.decimal   :lng, null: false
      t.string    :neighborhood
      t.string    :district
      t.string    :country

      t.timestamps null: false
    end

  end
end
