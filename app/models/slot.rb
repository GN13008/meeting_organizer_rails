class Slot < ApplicationRecord
  has_many :bookings

  validates :nb_agent, inclusion: { in: 0..100 }
end
