class CreateWeathers < ActiveRecord::Migration[7.1]
  def change
    create_table :weathers do |t|
      t.references :location, null: false, foreign_key: true
      t.string :main, null: :false
      t.decimal :temperature, precision: 5, scale: 2
      t.decimal :wind_speed, precision: 5, scale: 2
      t.decimal :humidity, precision: 5, scale: 2
      t.decimal :real_feel, precision: 5, scale: 2
      t.decimal :cloudiness, precision: 5, scale: 2
      t.decimal :pressure, precision: 6, scale: 2
      t.integer :visibility, limit: 2
      t.decimal :max_temperature, precision: 5, scale: 2
      t.decimal :min_temperature, precision: 5, scale: 2
      t.datetime :sunrise
      t.datetime :sunset
      t.timestamps
    end
  end
end
