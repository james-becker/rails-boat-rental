class Boat < ApplicationRecord

  CATEGORIES = ["Motorboat", "Sailboat", "Rib", "Catamaran", "Houseboat", "Jetski"]
  CAPACITIES = ["1 person", "2 people", "3 people", "4 people", "5 people",
                "6 people", "7 people","8 people", "9 people", "10 or more"]


  belongs_to :user
  has_many :reviews
  has_many :reservations
  has_attachments :photos, maximum: 10

  validates :description, presence: true
  validates :category, presence: true, inclusion: {in: CATEGORIES}
  validates :capacity, numericality: true, presence: true
  validates :price, numericality: true, presence: true
  validates :location, presence: true
  validates :name, presence: true
  validates :photos, presence: true

  def self.most_booked(n)

    # compter resa, tri, return les n premierd
    # I don't know French! - James

    @boats = Boat.all.sort { |x,y| y.reservations.count <=> x.reservations.count }
    @boats.last(n)
  end

  end

