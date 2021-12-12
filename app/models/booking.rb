class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :agent
  belongs_to :slot
end
