class Boat < ApplicationRecord

  CATEGORIES = ["Sailboat", "Canoe", "Pirate Ship", "Aircraft Carrier", "Steamboat"]

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
end
