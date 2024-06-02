require_relative 'ar.rb'

# Step 1: Find any product from the database
product = Product.first
puts product.inspect

# Step 2: Inspect the Product object you have retrieved
# Columns in products table: id, name, description, price, stock_quantity, category_id, created_at, updated_at

# Step 3: Use ActiveRecord to find and print out
# Total number of products
total_products = Product.count
puts "Total number of products: #{total_products}"

# The names of all products above $10 with names that begin with the letter C
products_above_10 = Product.where('price > ? AND name LIKE ?', 10, 'C%').pluck(:name)
puts "Products above $10 with names starting with 'C': #{products_above_10.join(', ')}"

# Total number of products with a low stock quantity
low_stock_products = Product.where('stock_quantity < ?', 5).count
puts "Total number of products with low stock quantity: #{low_stock_products}"

# Find the name of the category associated with one of the products you have found
category_name = product.category.name
puts "Category name: #{category_name}"

# Find a specific category and use it to build and persist a new product
category = Category.find_by(name: "Electronics")
new_product = category.products.build(name: "NewProduct", description: "NewDescription", price: 50, stock_quantity: 10)
new_product.save
puts "New product created: #{new_product.inspect}"

# Find a specific category and then use it to locate all the associated products over a certain price
expensive_products = category.products.where('price > ?', 30)
puts "Expensive products in Electronics: #{expensive_products.pluck(:name).join(', ')}"
