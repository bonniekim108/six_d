# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([

  {first_name: "DonnaJo", last_name: "Tanner", username: "fullhouse", email: "djtanner@example.com", password: "abc123", password_confirmation: "abc123"},
  {first_name: "Doogie", last_name: "Howser", username: "doogiehowser", email: "doogie@example.com", password: "abc123", password_confirmation: "abc123"},
  {first_name: "Winnie", last_name: "Cooper", username: "wonderyears", email: "kevinandwinnie@example.com", password: "abc123", password_confirmation: "abc123"},
  {first_name: "Zack", last_name: "Morris", username: "savedbythe", email: "zackmorris@example.com", password: "abc123", password_confirmation: "abc123"} 

  ])
