# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Pigeon.new(name: Faker::Name.middle_name, breed: Faker::Hacker.adjective, km_per_hour: rand(1..10), price_per_hour: rand(1..10)).save
end

