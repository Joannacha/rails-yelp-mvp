# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning DB"
Restaurant.destroy_all

puts"Creating 10 restaurants..."
10.times do 
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    category: Restaurant::CATEGORIES.sample,
    phone_number: Faker::PhoneNumber.cell_phone,
  )
  restaurant.save!
  rand(3..10).times do
    review = Review.new(
      content: Faker::Restaurant.review,
      rating: rand(1..5)
    )
    review.restaurant = restaurant
    review.save!
  end  
end
puts "All done"