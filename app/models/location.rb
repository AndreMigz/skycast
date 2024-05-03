class Location < ApplicationRecord
  validates :name, presence: :true
  validates :longitude, presence: :true
  validates :latitude, presence: :true

  has_many :weather_forecast, class_name: "Weather"
end
