require_relative 'ar.rb'

# Find one of the products you created in challenge_create.rb and delete it
product_to_delete = Product.find_by(name: "Product1")
if product_to_delete
  product_to_delete.destroy
  puts "Product deleted: #{product_to_delete.inspect}"
else
  puts "Product not found"
end
