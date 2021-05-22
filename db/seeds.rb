# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
roles = Role.create([ { name: "user" }, { name: "moderator" }, { name: "admin" }])
categories = Category.create([ { name: "Music" }, { name: "Science" }, { name: "Gaming" }, { name: "Movies" }, { name: "Anime" }])
user = User.create([{name:"OromeSS", email:"vpavlenchik@gmail.com", password:"q1w2e3r4t5y6u7i8o9p0",role_id:3}])