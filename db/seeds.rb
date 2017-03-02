require 'faker'

4.times do |i|

  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.dob = "31/10/1994"
  user.password = "password"
  user.photo_url = "http://lorempixel.com/400/200/people/"
  user.email = Faker::Internet.email
  user.save!

  3.times do |i|
    boat = Boat.new
    boat.category = Boat::CATEGORIES.sample
    boat.capacity = Boat::CAPACITIES.sample
    boat.price = Faker::Number.decimal(2)
    boat.location = ["Barcelona", "Madrid", "Varna", "Buenos Aires", "Rio", "Los Angeles"].sample
    boat.name = Faker::Name.first_name
    boat.description = ["This #{boat.name} boat is a 23 meters length charter yacht with fly bridge. Its excellent seaworthiness and spacious areas have made this yacht Astondoa Shipyard’s best-selling model. She can accommodates up to 10 people during the day and eight people at night in four en suite cabins made with fine materials. This yacht offers comfort in an elegant setting. This charter yacht has always been given an excellent level of maintenance, and a full refit was carried out in 2012, including fabrics, indoor and outdoor Hi-Fi, TV, home cinema, etc., making it look brand new. It has a wide range of water toys on board, including a tender and a jet ski.",
      "With 16 meters length, this #{boat.name} offers a perfect design that combines tradition with modern international class. She also has low fuel consumption, making it an ideal holiday yacht for sailing the Mediterranean. She can accommodates nine passengers during the day and six guests at night in three double cabins, one of them is en suite. She also has a lounge equipped with TV, DVD and CD radio.",
      "The #{boat.name} expresses exclusivity and elegance in it's 38 meters length. With capacity for 12 guests during the day and 12 at night in 5 luxury ensuite cabins. Equipped with jacuzzi, stabilizers and a big variety of toys. The flagship of the SD line is a four-decked motor yacht with an exquisite distribution that allows you to enjoy every zone in the yacht."].sample
    boat.user = user
    boat.photo_urls = ["http://res.cloudinary.com/demo/image/fetch/http://www.charteranddreams.com/media/products/161/san-lorenzo-126-san-lorenzo-126-a1253330-f.jpg",
      "http://res.cloudinary.com/demo/image/fetch/http://www.charteranddreams.com/media/products/2/admiral-154-admiral-154-8e03a178-6.jpeg",
      "http://res.cloudinary.com/demo/image/fetch/http://www.charteranddreams.com/media/products/2/admiral-154-admiral-154-693a3c47-5.jpg"]
    boat.save!
  end

  3.times do |i|
    reservation = Reservation.new
    reservation.start_time = Faker::Date.between(2.days.ago, Date.today)
    reservation.end_time = Faker::Date.forward(15)
    reservation.notes = Faker::Lorem.paragraph(3)
    reservation.count = Faker::Number.number(2)
    reservation.status = ["pending", "confirmed", "finished"].sample
    reservation.user = user
    reservation.boat = Boat.find((1..Boat.all.size).to_a.sample)
    reservation.save!
  end

  3.times do |i|
    review = Review.new
    review.content = Faker::Lorem.paragraph(3)
    review.stars = Faker::Number.between(0,5)
    review.user = user
    review.boat = Boat.find((1..Boat.all.size).to_a.sample)
    review.save!
  end
end
