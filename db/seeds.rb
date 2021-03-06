# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'open-uri'
require 'faker'

nb_admin = 1
nb_users = 5
nb_items = 20
nb_items_per_carts = 5
nb_items_per_orders = 5
nb_orders = 5
nb_cities = 5

nb_cities.times do |x|
  City.create(
  city: Faker::Address.city)
  puts "Seeding of city nb #{x}"
end

nb_admin.times do |x|
  User.create(
    first_name: "Admin",
    last_name: "User",
    description: "J'ai accès au Dashboard hihi",
    password: "admin1",
    email: "admin@admin.com",
  admin: true)
  puts "Seeding of the Admin"
end

#for the random startdate
t1 = Time.parse("2020-01-01 14:40:34")
t2 = Time.parse("2022-01-01 00:00:00")

nb_items.times do |x|
  item = Item.create(
    title: "Atelier " + Faker::Beer.brand,
    description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    price: rand(1..20),
    city_id: City.all.sample.id,
  date: rand(t1..t2))
  downloaded_image = open("https://picsum.photos/200/300")
  item.avatar.attach(io: downloaded_image  , filename: "faker.jpg")
  puts "seeding item nb #{x}"
end

nb_users.times do |x|
  fname = Faker::Name.first_name
  User.create(
    first_name: fname,
    password: 'azerty',
    description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    last_name: Faker::Name.last_name,
    email: fname + "@yopmail.com",
  admin: false)
  puts "Seeding of User nb #{x}"
end


nb_items_per_carts.times do |x|
  CartItem.create(
    cart_id: Cart.all.sample.id,
    item_id: Item.all.sample.id,
  quantity: rand(1..10))
  puts "Seed of items per Cart nb #{x}"
end

nb_orders.times do |x|
  Order.create(
  user_id: User.all.sample.id)
  puts "Seed of orders nb #{x}"
end

nb_items_per_orders.times do |x|
  OrderItem.create(
    order_id: Order.all.sample.id,
    item_id: Item.all.sample.id,
  quantity: rand(1..10))
  puts "Seed of items per order nb #{x}"
end
