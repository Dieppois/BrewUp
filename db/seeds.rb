require 'faker'

# Définition des types de bière et conditionnements possibles

# Création des utilisateurs
users = []
5.times do
  users << {
    role: User::ROLES.sample,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  }
end

created_users = User.create!(users)

# Création des bières pour chaque utilisateur
created_users.each do |user|
  beers = []
  10.times do
    beers << {
      name: Faker::Beer.name,
      degree: rand(3..12),
      centiliter: [25, 33, 50, 75].sample,
      unit_price: rand(2..20),
      conditionnement: Beer::CONDITIONNEMENTS.sample,
      beer_type: Beer::BEER_TYPES.sample,
      description: Faker::Lorem.sentence(word_count: 20),
      user_id: user.id
    }
  end
  Beer.create!(beers)
end

puts "5 utilisateurs et 50 bières ont été créés avec succès !"

