class Boat < ApplicationRecord

  CATEGORIES = ["Motorboat", "Sailboat", "Rib", "Catamaran", "Houseboat", "Jetski"]
  CAPACITIES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  belongs_to :user
  has_many :reviews
  has_many :reservations
  has_attachments :photos, maximum: 10

  validates :description, presence: true
  validates :category, presence: true, inclusion: {in: CATEGORIES}
  validates :capacity, numericality: true, presence: true, inclusion: {in: CAPACITIES}
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

