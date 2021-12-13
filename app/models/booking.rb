class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :agent
  belongs_to :slot

  validates :agent_id, uniqueness: { scope: :slot_id }

  before_create :book_an_agent

  def book_an_agent
    slot = self.slot
    slot.nb_agent = slot.nb_agent - 1
    slot.save
  end
end
