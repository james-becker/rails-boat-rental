require 'faker'

User.create({
  first_name: "James",
  last_name: "Becker",
  address: "1234",
  dob: "01/01/2000",
  password: "123456",
  photo_url: "http://lorempixel.com/400/200/people/",
  email: "john@lennon.com"
});



10.times do |i|

  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.address = Faker::Address.street_address
  user.dob = "01/01/2000"
  user.password = "password"
  user.photo_url = "http://lorempixel.com/400/200/people/"
  user.email = Faker::Internet.email
  user.save!

  3.times do |i|
    boat = Boat.new
    boat.description = Faker::Lorem.paragraph
    boat.category = ["Sailboat", "Canoe", "Pirate Ship", "Aircraft Carrier", "Steamboat"].sample
    boat.capacity = Faker::Number.number(2)
    boat.price = Faker::Number.decimal(2)
    boat.location = Faker::Address.city
    boat.name = Faker::Name.first_name
    boat.user = user
    boat.photo_urls = [
      Faker::LoremPixel.image("300x500"),
      Faker::LoremPixel.image("300x500"),
      Faker::LoremPixel.image("300x500")
    ]
    boat.save!
  end

  3.times do |i|
    reservation = Reservation.new
    reservation.start_time = Faker::Date.between(2.days.ago, Date.today)
    reservation.end_time = Faker::Date.forward(15)
    reservation.notes = Faker::Lorem.paragraph
    reservation.count = Faker::Number.number(2)
    reservation.status = ["pending", "confirmed", "finished"].sample
    reservation.user = user
    reservation.boat = Boat.find((1..Boat.all.size).to_a.sample)
    reservation.save!
  end

  3.times do |i|
    review = Review.new
    review.content = Faker::Lorem.paragraph
    review.stars = Faker::Number.between(0,5)
    review.user = user
    review.boat = Boat.find((1..Boat.all.size).to_a.sample)
    review.save!
  end
end

