# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



genders = %i[male female]


10.times do |n|
  x = Faker::Avatar.image
  puts x
  User.create!(first_name: "Example#{n}",
               last_name: 'User',
               email: "user#{n}@railstutorial.org",
               nickname: "hamada #{n + 1}#{n + 2}#{n + 3}",
               about_me: Faker::Lorem.sentence(n+5),
               password: 'password',
               password_confirmation: 'password',
               birthdate: ((n + 1) * 10).years.ago,
               admin: true,
               gender: genders[rand(genders.length)],
               picture: x)
end
99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = 'password'
  birthdate = 2.days.ago
  User.create!(first_name: first_name,
               last_name: last_name,
               email: email,
               password: password,
               password_confirmation: password,
               birthdate: birthdate,
               gender: genders[rand(genders.length)])
end


50.times do
  City.create!(name: Faker::Address.city)
end
# postsS
users = User.order(:created_at).take(7)
5.times do
  caption = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(caption: caption) }
end

users.each do |user|
  user.city = City.find(Faker::Number.between(1, 49))
  user.save!
end


# add 50 random posts to each user posts

users.each do |user|
  3.times do |i|
    caption = Faker::Lorem.sentence(5 + i) + user.full_name
    user.posts.create!(caption: caption)
  end
end


# Following relationships

first_user = users.first
buddies = users[2..50]
buddies.each { |buddy| first_user.add_friend(buddy) }


# Likes
posts = Post.all
first_post = posts.first
users.each { |user| user.like(first_post) }