# cleanning the DB
puts "----- Cleaning Database -----"

Booking.destroy_all
Slot.destroy_all
Agent.destroy_all
Day.destroy_all
User.destroy_all

puts "-------- Seeding in process --------"

puts "Creating 5 users - 2 agents and 3 clients"

user1 = User.create!(email: "gui@gmail.com", password: "password", name: "Agent Gui")
agent1 = Agent.create
agent1.user = user1
agent1.save
user2 = User.create!(email: "tom@gmail.com", password: "password", name: "Agent Tom") 
agent2 = Agent.create
agent2.user = user2
agent2.save

client1 = User.create!(email: "sandra@gmail.com", password: "password", name: "Client Sandra")
client2 = User.create!(email: "franck@gmail.com", password: "password", name: "Client Franck")
client3 = User.create!(email: "lou@gmail.com", password: "password", name: "Client Lou")
client4 = User.create!(email: "lea@gmail.com", password: "password", name: "Client lea")
client5 = User.create!(email: "yann@gmail.com", password: "password", name: "Client yann")


puts "Users are created"

puts "Creating Day for january"

for n in 3..4 # not 4, 7 if I want the all first week
  Day.create!(date: "#{n}/01/2022")
end
# first week of january
# # second week of january
# for n in 10..14
#   Slot.create!(date: "#{n}/01/2022", time_slot: slot, nb_agent: 2)
# end

puts "Slots are created"

puts "Creating Slot for january"

my_time_slots = ["9h à 10h", "10h à 11h" ] #"8h à 9h", "11h à 12h", "14h à 15h", "15h à 16h", "16h à 17h", "17h à 18h"

days = Day.all
days.each do |myday|
  my_time_slots.each do |time_slot|
    slot = Slot.create(time_slot: time_slot, nb_agent: 2)
    slot.day = myday
    slot.save
  end
end

puts "Slots are created"

puts "Creating booking"

# one place left on monday 03
lundi = Day.where(date: "03/01/2022").first
slotlundi = lundi.slots.where(time_slot: "10h à 11h").first
booking = Booking.create
booking.agent = agent1
booking.slot = slotlundi
booking.user = client1
booking.save

# no place left on thuesday 04
mardi = Day.where(date: "04/01/2022").first
slotmardi = mardi.slots.where(time_slot: "10h à 11h").first
booking2 = Booking.create
booking2.agent = agent1
booking2.slot = slotmardi
booking2.user = client2
booking2.save

booking3 = Booking.create
booking3.agent = agent2
booking3.slot = slotmardi
booking3.user = client3
booking3.save

puts "booking are done"
