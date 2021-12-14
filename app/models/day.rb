class Day < ApplicationRecord
  has_many :slots
  has_many :bookings, through: :slots

  def display_date
    I18n.l(self.date, format:'%a %d %B').capitalize()
  end 
end
