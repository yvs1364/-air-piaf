# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
Pigeon.destroy_all
User.destroy_all
mehdi = User.create!(name: 'Mehdi', email: 'mehdi@mail.fr', password: 'password', address: 'Paris')
yvan = User.create!(name: 'Yvan', email: 'Yvan@mail.fr', password: 'password', address: 'Pau')
manu = User.create!(name: 'Manu', email: 'manu@mail.fr', password: 'password', address: 'Marseille')

puts "#{User.count} users created"

18.times do
 pigeon = Pigeon.create!(
    name: %w[MattiOL Celio thibthibthib Laulau Beber Thethe Raphou eveuuuuuhh Seb Patoche Estelleuuuhh Jeromeeeeeuuuh Loulou Alixbaba Cams Gâteau Kevdu13 Deivid].sample,
    breed: ['Ice Pigeon', 'Antwerp Smerle', 'Oriental Roller', 'Egyptian Swift pigeon', 'Homing pigeon', 'Lahore pigeon'].sample,
    km_per_hour: rand(50..120),
    price_per_km: rand(10..30),
    address: %w[Marseille Paris Lyon Pau Genay Bamako Bordeaux cleveland berlin lisbonne milan tokyo].sample,
    user: [yvan, manu, mehdi].sample,
  )
    file = URI.open('https://source.unsplash.com/featured/?birds')
    pigeon.photo.attach(io:file,filename: 'pigeon.jpeg')
end
puts "#{Pigeon.count} pigeons created"
