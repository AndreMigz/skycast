class Weather < ApplicationRecord
  validates :main, presence: :true
  belongs_to :location
end
