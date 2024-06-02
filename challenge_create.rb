require_relative 'ar.rb'

# Create three new products using different methods
# Method 1: Using new and save
product1 = Product.new(name: "Product1", description: "Description1", price: 10, stock_quantity: 10)
product1.save
puts "Product 1 created: #{product1.inspect}"

# Method 2: Using create
product2 = Product.create(name: "Product2", description: "Description2", price: 20, stock_quantity: 20)
puts "Product 2 created: #{product2.inspect}"

# Method 3: Using a block
product3 = Product.new do |p|
  p.name = "Product3"
  p.description = "Description3"
  p.price = 30
  p.stock_quantity = 30
end
product3.save
puts "Product 3 created: #{product3.inspect}"

# Create a Product object that is missing some required columns
product_invalid = Product.new(name: "Short")
if product_invalid.save
  puts "Product saved successfully"
else
  puts "Errors: #{product_invalid.errors.full_messages.join(', ')}"
end
