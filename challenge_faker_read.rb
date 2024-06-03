require_relative 'ar.rb'

# Find all categories and display their names and associated products
categories = Category.all
categories.each do |category|
  puts "Category: #{category.name}"
  category.products.each do |product|
    puts "  Product: #{product.name} - Price: $#{product.price}"
  end
end
