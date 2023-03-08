class Booking < ApplicationRecord
  has_one :review
  belongs_to :user
  belongs_to :item

  validates :start_date, :end_date, :total_price, presence: true
  enum status: { pending: O, accepted: 1, declined: 2, canceled: 3 }
end
