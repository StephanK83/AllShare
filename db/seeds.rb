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
require "faker"

#User.destroy_all
#Item.destroy_all
#
#response = HTTParty.get('https://jsonplaceholder.typicode.com/users')
#users = JSON.parse(response.body)
#
#users.each do |user|
#  User.create!(
#    email: user['email'],
#    first_name: user['name'].split(' ').first,
#    last_name: user['name'].split(' ').last,
#    street_name: user['address']['street'],
#    postal_code: user['address']['zipcode'],
#    city: user['address']['city'],
#    password: "123456"
#  )
#end

# Item seeds

  Item.create(
    category: "Audio & Visual",
    name: "Audio gear",
    description: "Best audio gear in your neighborhood",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1677694666937-f8a8b4e05112?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
  )

  Item.create(
    category: "Audio & Visual",
    name: "Led video Light",
    description: "Video light for rent at a good price",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1639085046855-4d313ff26b46?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
  )

  Item.create(
    category: "Film & Photography",
    name: "Canon EOS 5D Mark III",
    description: "Write me for more info",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1598447859034-a4552ac60c62?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80"
  )

  Item.create(
    category: "Film & Photography",
    name: "SONY, ILCE-7M2",
    description: "Vintage sony camera, great picture",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1551264950-49fb963d1493?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
  )

  Item.create(
    category: "Projectors & Screens",
    name: "BenQ WXGA projector",
    description: "3 mega pixel resolution",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1528395874238-34ebe249b3f2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
  )

  Item.create(
    category: "Projectors & Screens",
    name: "Vintage projector",
    description: "",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1627597986056-56a756829dbf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
  )

  Item.create(
    category: "Drones",
    name: "Phantom 4 DJI",
    description: "Remote control and live feed is based on DJI Lightbridge technology, providing effective control range of up to 3.1mi",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1508614589041-895b88991e3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=812&q=80"
  )

  Item.create(
    category: "Drones",
    name: "Phantom 4 DJI",
    description: "Remote control and live feed is based on DJI Lightbridge technology, providing effective control range of up to 3.1mi (5.5 km)",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1508614589041-895b88991e3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=812&q=80"
  )

  Item.create(
    category: "Drones",
    name: "Mavik 4 DJI",
    description: "portable and powerful drone with a 3-axis gimbal 4K camera, a max transmission range of 4.1 mi (7 km)",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1555009306-9e3c5b6a66e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80"
  )

  Item.create(
    category: "Drones",
    name: "Mavik 4 DJI",
    description: "portable and powerful drone with a 3-axis gimbal 4K camera, a max transmission range of 4.1 mi (7 km)",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1555009306-9e3c5b6a66e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80"
  )

  Item.create(
    category: "DJ equipement",
    name: "Pioneer DJ, DDJ-200, Smart",
    description: "Start DJing with this easy-to-use DDJ-200 smart DJ controller. Lightweight and compact with a pro-style layout",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1529392960549-df4af50eac23?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
  )

  Item.create(
    category: "DJ equipement",
    name: "Pioneer DJ, DDJ-400, Smart",
    description: "DDJ-200 PRO DJ controller. Compact and full of functionalities with a pro-style layout",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1529392960549-df4af50eac23?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
  )

  Item.create(
    category: "Storage",
    name: "Underground garage",
    description: "Contact me for more information",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1589018057745-8c699b3f361c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
  )

  Item.create(
    category: "Electronics",
    name: "Miscellaneous electric components",
    description: "Contact me for more information",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1555664424-778a1e5e1b48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
  )

  Item.create(
    category: "Transport",
    name: "City bike for rent",
    description: "Useful around the city, drop me an inbox",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1614289305732-80fafc13d78b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
  )

  Item.create(
    category: "Transport",
    name: "Vespas scooter",
    description: "In any color you want and different engine sizes",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1645520431043-6e76fe60466d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
  )

  Item.create(
    category: "Sport",
    name: "Klint ski",
    description: "Used them two times, they're as good as new, come with sticks",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1519049069275-dea996e1a314?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80"
  )

  Item.create(
    category: "Sport",
    name: "Climbing harnesses, quickdraws and slings",
    description: "Can rent you all the material for your first climbing trip",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1674558346964-e7196a409880?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
  )

  Item.create(
    category: "Home, Office and Garden",
    name: "Stylish office chairs",
    description: "Ergonomic and elegant chairs for rent",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1525896544042-354764aa27e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
  )

  Item.create(
    category: "Home, Office and Garden",
    name: "Wooden desk",
    description: "Ergonomic and elegant desk for rent, option to buy it after minimum 7 days of use",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1611269154421-4e27233ac5c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80"
  )

  Item.create(
    category: "Clothing",
    name: "Vintage Levi's jeans",
    description: "Different fabrics and color available",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1542272604-787c3835535d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=726&q=80"
  )

  Item.create(
    category: "Clothing",
    name: "Black leather jacker",
    description: "Option to buy after one month of use",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1551028719-00167b16eac5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8amFja2V0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
  )

  Item.create(
    category: "Holiday & Travel",
    name: "One bedroom for rent in our countryside house",
    description: "200 acres of park aroud it",
    price: Faker::Number.between(from: 50, to: 100),
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1595877244574-e90ce41ce089?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHN1bW1lciUyMGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
  )

  Item.create(
    category: "Holiday & Travel",
    name: "2 people tent",
    description: "Roomy but without being heavy, very sturdy, easy to pitch and made using recycled materials",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1624923686627-514dd5e57bae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dGVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
  )


  Item.create(
    category: "Kids & Baby",
    name: "Child's car seat",
    description: "1x Joie Spin ISOFix Group 0-1 Car Seat in Ember. Suitable from birth to 18kg (4 years approx.)",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1619719287848-883c8f26efbc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
  )

  Item.create(
    category: "Kids & Baby",
    name: "Child's bike",
    description: "Balance bike for kids, helmet not included",
    price: Faker::Commerce.price,
    user_id: User.all.pluck(:id).sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    min_days_rent: Faker::Number.between(from: 1, to: 7),
    postal_code: Faker::Address.zip_code,
    picture: "https://images.unsplash.com/photo-1517218578717-195e17f7c28f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fGNoaWxkJTIwYmlrZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
  )

  # Booking seeds

 #Booking.create(
 # start_date: Fri, 10 Mar 2023,
 # end_date: Sat, 11 Mar 2023,
 # total_price: @quantity,
 # status: "closed",
 # user_id: User.all.pluck(:id).sample,
 # item_id: Item.all.pluck(:id).sample,
