class Booking < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :item

  validates :start_date, :end_date, presence: true
  enum status: { pending: 0, accepted: 1, declined: 2, cancelled: 3 }

  def total_price
    number_of_days = end_date - start_date
    return (item.price * number_of_days).to_i
  end

end
