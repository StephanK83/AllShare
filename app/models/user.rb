class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_email

  has_many :items, dependent: :destroy
  has_many :reviews, dependent: :destroy # should we have the reviews through bookings table?
  has_many :bookings, dependent: :destroy # bookings as a client
  has_many :bookings_as_owner, through: :items, source: :bookings, dependent: :destroy
  has_many :messages, dependent: :destroy
  #validates :first_name, :last_name, :street_name, :city, :postal_code, :country, :phone, presence: true

  acts_as_favoritor

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
