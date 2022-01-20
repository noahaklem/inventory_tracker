# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do 
  location = Faker::Nation.capital_city
  Warehouse.create({
    location: location
  })
end

15.times do
  name = Faker::Superhero.unique.name
  price = [2,30,22,1,3.25,4.50].sample
  description = Faker::Hipster.sentence
  Product.create(name: name, price: price, description: description)
end

10.times do 
  ProductWarehouse.create(product: Product.all.sample, warehouse: Warehouse.all.sample)
end

puts "seeds completed"