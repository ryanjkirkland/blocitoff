require 'Faker'

50.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

user = User.all

150.times do
  Item.create!(
    name: Faker::Name.name,
    user_id: user.sample.id,
    completed: false
  )
end

puts "Seeds finsihed"
puts "#{User.count} users created."
