class CreateTables < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string  :borough, null: false
      t.string  :name, null: false
      t.string  :street_address, null: false
      t.string  :days, null: false
      t.string  :hours, null: false
      t.integer :distribute_health_bucks, null: false
      t.integer :accepts_health_bucks, null: false
      t.integer :ebt, null: false
      t.integer :stellar, null: false

      t.timestamps null: false
    end

    create_table :geodata do |t|
      t.integer   :market_id, null: false
      t.string    :street_address, null: false
      t.string    :city, null: false
      t.string    :state_code, null: false
      t.string    :state_name, null: false
      t.string    :zip, null: false
      t.string    :country_code, null: false
      t.string    :province, null: false
      t.string    :full_address, null: false
      t.decimal   :lat, null: false
      t.decimal   :lng, null: false
      t.string    :neighborhood, null: false
      t.string    :district, null: false
      t.string    :country, null: false

      t.timestamps null: false
    end

  end
end
