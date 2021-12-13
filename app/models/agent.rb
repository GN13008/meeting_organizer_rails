class Agent < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :slots, through: :bookings
end
