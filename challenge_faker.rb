require_relative 'ar.rb'
require 'faker'

# Generate 10 new categories and 10 new products for each category
10.times do
  category = Category.create(name: Faker::Commerce.department)
  10.times do
    category.products.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      stock_quantity: rand(1..100)
    )
  end
end
puts "10 categories and 10 products for each category created."
