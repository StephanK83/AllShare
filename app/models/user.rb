class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :reviews # should we have the reviews through bookings table?
  has_many :bookings # bookings as a client
  has_many :bookings_as_owner, through: :items, source: :bookings
  has_many :messages
  #validates :first_name, :last_name, :street_name, :city, :postal_code, :phone, presence: true

  acts_as_favoritor
end
