# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "yaml"
require "httparty"

response = HTTParty.get('https://jsonplaceholder.typicode.com/users')
users = JSON.parse(response.body)

users.each do |user|
  User.create!(
    email: user['email'],
    first_name: user['name'].split(' ').first,
    last_name: user['name'].split(' ').last,
    street_name: user['address']['street'],
    postal_code: user['address']['zipcode'],
    city: user['address']['city'],
    password: "123456"
  )
end

file_items = File.open("/home/lorenzo/code/lorenzb58/AllShare/storage/Items_seeds.json")
items = JSON.parse(file_items.read)


p items
