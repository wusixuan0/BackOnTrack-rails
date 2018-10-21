# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Testing.create! ({
  message: "hello world"
})

@user1 = User.create! ({
  first_name: "Patrick",
  last_name: "Chu",
  email: "doctor@test.com",
  password: "abc123",
  password_confirmation: "abc123",
  role: "doctor"
})

@user2 = User.create! ({
  first_name: "MingWei",
  last_name: "Chu",
  email: "client@test.com",
  password: "abc123",
  password_confirmation: "abc123",
  role: "client"
})
@user2.todo_lists.create! ({
  title: "exercise1",
  content: "im content1"
})
puts @user2.todo_lists.all.inspect