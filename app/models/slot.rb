class Slot < ApplicationRecord
  belongs_to :day
  has_many :bookings

  validates :nb_agent, inclusion: { in: 0..100 }
end
