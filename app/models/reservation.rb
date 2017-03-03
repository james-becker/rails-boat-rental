class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :boat

  STATUSES = ['upcoming', 'past']

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :notes, presence: true
  validates :count, presence: true, numericality: true
  validates :status, presence: true
end
