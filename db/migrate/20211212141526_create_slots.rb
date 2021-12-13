class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.string :time_slot
      t.integer :nb_agent

      t.timestamps
    end
  end
end
