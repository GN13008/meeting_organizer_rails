class AddDayToSlot < ActiveRecord::Migration[6.1]
  def change
    add_reference :slots, :day, index: true
  end
end
