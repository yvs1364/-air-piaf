# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pigeon.destroy_all
User.destroy_all
mehdi = User.create!(name: "Mehdi", email: "mehdi@mail.fr", password: "password", address: "Marseille")
yvan = User.create!(name: "Yvan", email: "Yvan@mail.fr", password: "password", address: "Marseille")
manu = User.create!(name: "Manu", email: "manu@mail.fr", password: "password", address: "Marseille")

puts "#{User.count} users created"


10.times do
  Pigeon.create!(
    name: Faker::Name.middle_name,
    breed: Faker::Hacker.adjective,
    km_per_hour: rand(1..10),
    price_per_km: rand(1..10),
    user: [yvan, manu, mehdi].sample
  )
end
puts "#{Pigeon.count} pigeons created"
