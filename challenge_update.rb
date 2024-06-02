require_relative 'ar.rb'

# Find all products with a stock quantity greater than 40
products_to_update = Product.where('stock_quantity > ?', 40)
products_to_update.each do |product|
  product.stock_quantity += 1
  product.save
  puts "Updated product: #{product.inspect}"
end
