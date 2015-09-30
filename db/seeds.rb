require 'faker'

#Create wikis
10.times do
  wiki = Wiki.create!(
  title:  Faker::Lorem.sentence,
  body:  Faker::Lorem.paragraph,
  )
end
wikis = Wiki.all

#Create an admin user
admin = User.create!(
  name:    'Admin User',
  email:   'admin@example.com',
  password:'helloworld',
  role:    'admin'
)
admin.skip_confirmation!
admin.save

#Create a standard user
standard = User.create!(
  name:     'Standard User',
  email:    'standard@example.com',
  password: 'helloworld',
  role:     'standard'
)
standard.skip_confirmation!
standard.save

#Create a premium user
premium = User.create!(
  name:     'Premium User',
  email:    'premium@example.com',
  password: 'helloworld',
  role:     'premium'
)
premium.skip_confirmation!
premium.save

user = User.create!(
  name:     "Jon Malis",
  email:    "monkeydogphotography@gmail.com",
  password: "konibear",
  role:     'admin'
)
user.skip_confirmation!
user.save


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
