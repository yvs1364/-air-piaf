# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pigeon.destroy_all
User.destroy_all
mehdi = User.create!(name: "Mehdi", email: "mehdi@mail.fr", password: "password", address: "Paris")
yvan = User.create!(name: "Yvan", email: "Yvan@mail.fr", password: "password", address: "Pau")
manu = User.create!(name: "Manu", email: "manu@mail.fr", password: "password", address: "Marseille")

puts "#{User.count} users created"



10.times do
  Pigeon.create!(
    name: Faker::Name.middle_name,
    breed: ["Ice Pigeon", "Antwerp Smerle", "Oriental Roller", "Egyptian Swift pigeon", "Homing pigeon", "Lahore pigeon"].sample,
    km_per_hour: rand(50..120),
    price_per_km: rand(1..30),
    address: ["Marseille", "Paris", "Lyon", "Pau", "Genay", "Venissieux", "Bordeaux", "Brest"].sample,
    user: [yvan, manu, mehdi].sample
  )
end
puts "#{Pigeon.count} pigeons created"

#address
