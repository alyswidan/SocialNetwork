# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
User.create!(first_name: "Example#{n}",
             last_name: 'User',
             email: "user#{n}@railstutorial.org",
             nickname: "hamada #{n + 1}#{n + 2}#{n + 3}",
             about_me: Faker::Lorem.sentence(n+5),
             password: 'password',
             password_confirmation: 'password',
             birthdate: ((n + 1) * 10).years.ago,
             admin:true)
end
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'passwordpassword'
  birthdate = 2.days.ago
  User.create!(first_name: name.split(' ')[0],
               last_name: name.split(' ')[1],
               email: email,
               password: password,
               password_confirmation: password,
               birthdate: birthdate)
end
# postsS
users = User.order(:created_at).take(3)
1.times do
  caption = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(caption: caption) }
end

# Following relationships
users = User.all
user = users.first
buddies = users[2..50]
buddies.each { |buddy| user.add_friend(buddy) }
