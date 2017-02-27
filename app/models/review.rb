class Review < ApplicationRecord
  belongs_to :boat
  belongs_to :user

  validates :content, presence: true
  validates :stars, inclusion: [0,1,2,3,4,5], presence: true
end
