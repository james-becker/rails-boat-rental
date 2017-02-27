class User < ApplicationRecord
  has_many :boats
  has_many :reservations
  has_many :reviews
  has_attachment :photo, maximum: 1

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :age, presence: true, numericality: {only_integer: true}
  validates :photo, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
