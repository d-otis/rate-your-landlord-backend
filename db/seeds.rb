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

num_landlords = 5
num_properties_per_landlord = 3

num_photos = num_landlords * num_properties_per_landlord

photos = Unsplash::Photo.search('apartment', page = rand(1..20), per_page = num_photos, orientation = 'landscape')
landlord_images = Unsplash::Photo.random(orientation: 'squarish', count: num_landlords, query: 'person')
l = 0
i = 0

num_landlords.times do 
  Landlord.create(
    name: Faker::Name.name,
    image_url: landlord_images[l].urls.regular
  )
  l += 1
end

puts "You have made #{Landlord.count} landlords"

num_properties_per_landlord.times do
  Landlord.all.each do |ll|
    property = Property.create(
      address: Faker::Address.full_address,
      image_url: photos[i].urls.regular
    )
    ll.properties << property
    i += 1
  end
end

puts "#{Property.count} properties created!"

Property.all.each do |p|
  2.times do
    p.reviews.create(
      content: LoremIpsumText::multiple_para(rand(1..3)).join("\r\n\r\n"),
      rating: rand(1..5)
    )
  end
  p.set_rating
  p.landlord.set_rating
  puts "#{p.address} has #{p.reviews.count} reviews"
end
