100.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password,
               uid: n
  )
end

100.times do |n|
  content = Faker::Lorem.paragraphs
  user_id = Faker::Number.between(1, 100)
  Topic.create!(
               content: content,
               user_id: user_id
  )
end