# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a main sample user.
User.create!(name: Faker::Name.name,
  email: "example@railstutorial.org",
  password:"foobar",
  password_confirmation: "foobar")
  # Generate a bunch of additional users.
  99.times do |n|
    j=1
    name = Faker::Name.name
    email = "employee_#{n}@mail.com"
    password = "123456"
    ids = User.create([{name: name, email: email, 
      password: password, 
      password_confirmation: password},])  
  end   
