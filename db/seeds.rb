# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "sian@stone.com", password: "foobar")
kennel_owner = User.create(email: "owner@kennel.com", password: "foobar")
vet = Vet.create(clinic_name: "Alders Vets", primary_veterinarian: "Amy", address: "123 Fake Street", phone_num: "9911 9922")

kennel = Kennel.create(
  name: "5 Acres",
  address: "42 Willow Lane",
  capacity: 30,
  description: "Beautiful acreage with lots of space for happy puppers",
  day_care: true,
  dog_walking: true,
  behaviorist: false,
  daily_price: 12,
  user_id: kennel_owner.id
  )
flynn = Dog.create(name: "Flynn", user_id: user.id, vet_id: vet.id)

