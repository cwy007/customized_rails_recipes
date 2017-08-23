# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ticket.delete_all
Event.find_each do |e|
  5.times do |i|
    Ticket.create(
      name: "name#{i}",
      price: i * 100,
      description: "No#{i}: This is ticket's description.",
      event_id: e.id
    )
  end
end

puts "为每个 Event 新增5种 Tickets。"
