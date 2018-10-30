# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@user1 = User.create! ({
  first_name: "Patrick",
  last_name: "Chu",
  email: "doctor@test.com",
  password: "1",
  password_confirmation: "1",
  role: "physiotherapist" #Dietitian #counselor
})

@user2 = User.create! ({
  first_name: "MingWei",
  last_name: "Chu",
  email: "client@test.com",
  password: "1",
  password_confirmation: "1",
  role: "client"
})

@user3 = User.create! ({
  first_name: "Sixuan",
  last_name: "Wu",
  email: "client2@test.com",
  password: "1",
  password_confirmation: "1",
  role: "client"
})

@user4 = User.create! ({
  first_name: "Jeffery",
  last_name: "Chu",
  email: "doctor2@test.com",
  password: "1",
  password_confirmation: "1",
  role: "dietitian" #dietitian #counselor
})
Doctor.create({user_id: 1})

Client.create({user_id: 2})
Client.create({user_id: 3})
Doctor.create({user_id: 4})
Relation.create({doctor_id: 1, client_id: 1})
Relation.create({doctor_id: 2, client_id: 1})

Reminder.create! ({
  doctor_id: 1,
  client_id: 1,
  title: "exercise1",
  content: "im content1"
})
Reminder.create! ({
  doctor_id: 1,
  client_id: 2,
  title: "exercise1",
  content: "im content1"
})
Reminder.create! ({
  doctor_id: 2,
  client_id: 2,
  title: "exercise1",
  content: "im content1"
})
Reminder.create! ({
  doctor_id: 2,
  client_id: 1,
  title: "exercise1",
  content: "im content1"
})

