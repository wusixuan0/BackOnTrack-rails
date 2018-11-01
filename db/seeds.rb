# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create! ({
  first_name: "Lorenzo",
  last_name: "Dyce",
  email: "doctor4@test.com",
  password: "123",
  password_confirmation: "123",
  role: "Dietitian" #dietitian #counselor
})

User.create! ({
  first_name: "Vincent",
  last_name: "Ly",
  email: "doctor5@test.com",
  password: "123",
  password_confirmation: "123",
  role: "Counselor" #dietitian #counselor
})

User.create! ({
  first_name: "Sixuan",
  last_name: "Wu",
  email: "client@test.com",
  password: "123",
  password_confirmation: "123",
  role: "client"
})

User.create! ({
  first_name: "Rachel",
  last_name: "Siu",
  email: "client3@test.com",
  password: "123",
  password_confirmation: "123",
  role: "client"
})

User.create! ({
  first_name: "Emma",
  last_name: "Mcphail",
  email: "doctor3@test.com",
  password: "123",
  password_confirmation: "123",
  role: "client"
})

Doctor.create({user_id: 1})
Doctor.create({user_id: 2})

Client.create({user_id: 3})
Client.create({user_id: 4})
Client.create({user_id: 5})
Relation.create({doctor_id: 1, client_id: 1})
Relation.create({doctor_id: 1, client_id: 2})
Relation.create({doctor_id: 1, client_id: 3})
Relation.create({doctor_id: 2, client_id: 1})
Relation.create({doctor_id: 2, client_id: 2})
Relation.create({doctor_id: 2, client_id: 3})

Reminder.create! ({
  doctor_id: 1,
  client_id: 1,
  title: "food log",
  content: "Do a daily food log on this website"
})
Reminder.create! ({
  doctor_id: 1,
  client_id: 1,
  title: "limit sugar intake",
  content: "Keep track of amount of carbohydrates consumed"
})
Reminder.create! ({
  doctor_id: 1,
  client_id: 1,
  title: "exercise log",
  content: "Do a daily exercise log on this website"
})
Reminder.create! ({
  doctor_id: 1,
  client_id: 2,
  title: "increase protein intake",
  content: "Eat more protein!"
})
Reminder.create! ({
  doctor_id: 2,
  client_id: 1,
  title: "diary",
  content: "write diary when you have negative feelings"
})
Reminder.create! ({
  doctor_id: 2,
  client_id: 1,
  title: "meditation",
  content: "Meditate before bed"
})
Reminder.create! ({
  doctor_id: 2,
  client_id: 1,
  title: "limit caffein intake",
  content: "Keep coffee consumption at one cup per day"
})

Nutrition.create! ({
  user_id: 3,
  name: 'egg',
  quantity: 1,
  serving_size: 50,
  calories: 71.5,
  carbohydrates: 0.36,
  protein: 6.28,
  fat: 4.76
})

Nutrition.create! ({
  user_id: 4,
  name: 'egg',
  quantity: 1,
  serving_size: 50,
  calories: 71.5,
  carbohydrates: 0.36,
  protein: 6.28,
  fat: 4.76
})
Nutrition.create! ({
  user_id: 3,
  name: 'bacon',
  quantity: 3,
  serving_size: 34.5,
  calories: 161.46,
  carbohydrates: 0.59,
  protein: 11.7,
  fat: 12.11
})
Exercise.create! ({
  user_id: 3,
  name: 'running',
  duration: 30,
  calories: 355.25
})
# Exercise.create! ({
#   user_id: 2,
#   name: 'gym',
#   duration: 100,
#   calories: 80
# })

# Exercise.create! ({
#   user_id: 3,
#   name: 'running',
#   duration: 100,
#   calories: 80
# })



