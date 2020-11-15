# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, username: Faker::Internet.username, password: 'password', password_confirmation: 'password')
end

{ easy: 10, medium: 20, hard: 30 }.each do |difficulty, score|
  Category.create(difficulty: difficulty, score: score)
end

difficulties = Category.all.map(&:id)

60.times do
  Card.create(category_id: difficulties.sample, workout: Faker::Games::Pokemon.name, description: Faker::Games::Pokemon.move)
end
