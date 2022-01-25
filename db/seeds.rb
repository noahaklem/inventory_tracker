# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


3.times do 
  name = Faker::Superhero.unique.name
  email = Faker::Internet.email
  User.create(
    name: name, 
    email: email, 
    password_digest: "test"
  )
end

15.times do
  name = Faker::Artist.unique.name
  price = [2,30,22,1,3.25,4.50].sample
  description = Faker::Quote.most_interesting_man_in_the_world
  quantity = [300,12,16,1,5,36,80].sample
  user = User.all.sample
  Product.create(
    name: name, 
    price: price, 
    description: description, 
    quantity: quantity, 
    user: user
  )
end

4.times do 
  name = Faker::Nation.capital_city
  Warehouse.create(
    name: name,
    user: User.all.sample
  )
end

15.times do 
  WarehouseProduct.create(
    warehouse: Warehouse.all.sample,
    product: Product.all.sample
  )
end

puts "seeds completed"