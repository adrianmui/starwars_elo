# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = Player.new()
a.name = "adrian"
a.height = 100
a.mass = 100
a.birth_year = "052695"
a.gender = "male"
a.homeworld = "Earth"
a.save