# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Landlord.destroy_all
Property.destroy_all

num_landlords = 5

num_landlords.times do 
  Landlord.create(
    name: Faker::Name.name,
    rating: rand * 5
  )
end

puts "You have made #{Landlord.count} landlords"

5.times do 
  Landlord.all.each do |ll|
    property = Property.create(
      address: Faker::Address.full_address,
      rating: rand * 5
    )
    ll.properties << property
  end
end

puts "#{Property.count} properties created!"

# Make Reviews!