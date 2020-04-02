# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

userNo1 = User.create(
  name:                   'foobar',
  email:                  'foo@bar.com',
  password:               'foobar',
  password_confirmation:  'foobar'
)

1.upto(10) do |i|
  User.create(
    name:                   Faker::Military.marines_rank,
    email:                  "user#{i}@email.com",
    password:               'foobar',
    password_confirmation:  'foobar'
  )
end
