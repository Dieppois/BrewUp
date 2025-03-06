require 'faker'
require "open-uri"

# Définition des types de bière et conditionnements possibles

# Création des utilisateurs
users = []
5.times do
  users << {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  }
end

created_users = User.create!(users)

# Création des bières pour chaque utilisateur

file = URI.parse("https://petitecave.ch/4931-large_default/heineken-original-24x25cl.jpg")
created_users.each do |user|
  3.times do
    beer_record = Beer.create!(
      name: Faker::Beer.name,
      degree: rand(3..12),
      centiliter: Beer::CENTILITER.sample,
      unit_price: rand(2..20),
      conditionnement: Beer::CONDITIONNEMENTS.sample,
      beer_type: Beer::BEER_TYPES.sample,
      description: Faker::Lorem.sentence(word_count: 20),
      user_id: user.id
    )
    file.open { |f| beer_record.photo.attach(io: f, filename: "beer.jpg", content_type: "image/jpg") }
  end
end

puts "5 utilisateurs et 50 bières ont été créés avec succès !"
