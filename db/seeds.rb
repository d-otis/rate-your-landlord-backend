# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Landlord.destroy_all
Property.destroy_all
Review.destroy_all

num_landlords = 2
num_properties_per_landlord = 3

num_landlords.times do 
  Landlord.create(
    name: Faker::Name.name
  )
end

puts "You have made #{Landlord.count} landlords"

num_properties_per_landlord.times do 
  Landlord.all.each do |ll|
    property = Property.create(
      address: Faker::Address.full_address
    )
    ll.properties << property
  end
end

puts "#{Property.count} properties created!"

Property.all.each do |p|
  2.times do
    p.reviews.create(
      content: Faker::Lorem.paragraph(sentence_count: 4),
      rating: rand(1..5)
    )
  end
  p.set_rating
  p.landlord.set_rating
  puts "#{p.address} has #{p.reviews.count} reviews"
end
