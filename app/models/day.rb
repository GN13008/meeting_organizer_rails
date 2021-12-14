class Day < ApplicationRecord
  has_many :slots
  has_many :bookings, through: :slots
end
