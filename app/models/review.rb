class Review < ApplicationRecord
  belongs_to :reservation

  validates :content, presence: true
  validates :stars, inclusion: [0,1,2,3,4,5], presence: true
end
