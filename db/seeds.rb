# cleanning the DB
puts "----- Cleaning Database -----"

Booking.destroy_all
Slot.destroy_all
Agent.destroy_all
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


puts "Users are created"

puts "Creating Slot for january"
# 
my_time_slots = ["9h-10h", "10h-11h" ] #"8h-9h", "11h-12h", "14h-15h", "15h-16h", "16h-17h", "17h-18h"
# first week of january
for n in 3..4 # not 4, 7 if I want the all first week
  my_time_slots.each do |slot|
    Slot.create!(date: "#{n}/01/2022", time_slot: slot, nb_agent: 2)
  end
end
# # second week of january
# for n in 10..14
#   my_time_slots.each do |slot|
#     Slot.create!(date: "#{n}/01/2022", time_slot: slot, nb_agent: 2)
#   end
# end

puts "Slots are created"

puts "Creating booking"

# one place left on monday 03
lundi = Slot.where(date: "03/01/2022", time_slot: "10h-11h").first
booking = Booking.create
booking.agent = agent1
booking.slot = lundi
booking.user = client1
booking.save
lundi.nb_agent = lundi.nb_agent - 1
lundi.save

# no place left on thuesday 04
mardi = Slot.where(date: "04/01/2022", time_slot: "10h-11h").first
booking = Booking.create
booking.agent = agent1
booking.slot = lundi
booking.user = client1
booking.save
mardi.nb_agent = mardi.nb_agent - 1
mardi.save

booking = Booking.create
booking.agent = agent2
booking.slot = lundi
booking.user = client1
booking.save
mardi.nb_agent = mardi.nb_agent - 1
mardi.save

puts "booking are done"
