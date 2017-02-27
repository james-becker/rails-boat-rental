class User < ApplicationRecord
  has_many :boats
  has_many :reservations
  has_many :reviews

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :address, presence: :true
  validates :dob, presence: :true, numericality: {only_integer: :true}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
