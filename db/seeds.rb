# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

db = User.create!(email: "db@hotmail.com", password: "aaaaaaa", password_confirmation: "aaaaaaa", firstname: "David", lastname: "Begert", is_admin: true)