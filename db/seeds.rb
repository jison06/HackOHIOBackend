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

easy = Category.find_by(difficulty: 'easy')
Card.create(category_id: easy.id, workout: 'Pushups', description: 3)
Card.create(category_id: easy.id, workout: 'Sit Ups', description: 10)
Card.create(category_id: easy.id, workout: 'Burpees', description: 5)
Card.create(category_id: easy.id, workout: 'Squats', description: 10)
Card.create(category_id: easy.id, workout: 'Lunge', description: 5)
Card.create(category_id: easy.id, workout: 'Tuck-Jumps', description: 3)
Card.create(category_id: easy.id, workout: 'Leg Raises', description: 10)
Card.create(category_id: easy.id, workout: 'Calf Raises', description: 5)
Card.create(category_id: easy.id, workout: 'Shoulder Taps', description: 5)
Card.create(category_id: easy.id, workout: 'Russian Twists', description: 10)
Card.create(category_id: easy.id, workout: 'Squat-Reach-Jump', description: 5)
Card.create(category_id: easy.id, workout: 'Dips', description: 3)

medium = Category.find_by(difficulty: 'medium')
Card.create(category_id: medium.id, workout: 'Pushups', description: 10)
Card.create(category_id: medium.id, workout: 'Sit Ups', description: 20)
Card.create(category_id: medium.id, workout: 'Burpees', description: 10)
Card.create(category_id: medium.id, workout: 'Squats', description: 20)
Card.create(category_id: medium.id, workout: 'Lunge', description: 15)
Card.create(category_id: medium.id, workout: 'Tuck-Jumps', description: 10)

hard = Category.find_by(difficulty: 'hard')
Card.create(category_id: hard.id, workout: 'Pushups', description: 25)
Card.create(category_id: hard.id, workout: 'Sit Ups', description: 50)
Card.create(category_id: hard.id, workout: 'Burpees', description: 20)
Card.create(category_id: hard.id, workout: 'Squats', description: 50)
Card.create(category_id: hard.id, workout: 'Lunge', description: 30)
Card.create(category_id: hard.id, workout: 'Tuck-Jumps', description: 25)
