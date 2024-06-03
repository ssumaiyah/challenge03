require_relative 'ar.rb'

# Method 1: Using new and save
product1 = Product.new(name: "Product1", description: "Description1", price: 10, stock_quantity: 10)
if product1.save
  puts "Product 1 created: #{product1.inspect}"
else
  puts "Product 1 errors: #{product1.errors.full_messages.join(', ')}"
end

# Method 2: Using create
product2 = Product.create(name: "Product2", description: "Description2", price: 20, stock_quantity: 20)
if product2.persisted?
  puts "Product 2 created: #{product2.inspect}"
else
  puts "Product 2 errors: #{product2.errors.full_messages.join(', ')}"
end

# Method 3: Using a block
product3 = Product.new do |p|
  p.name = "Product3"
  p.description = "Description3"
  p.price = 30
  p.stock_quantity = 30
end
if product3.save
  puts "Product 3 created: #{product3.inspect}"
else
  puts "Product 3 errors: #{product3.errors.full_messages.join(', ')}"
end

# Create a Product object that is missing some required columns
product_invalid = Product.new(name: "Short")
if product_invalid.save
  puts "Product saved successfully"
else
  puts "Errors: #{product_invalid.errors.full_messages.join(', ')}"
end
