class Booking < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :item

  validates :start_date, :end_date, presence: true
  validate :min_days_rent
  enum status: { pending: 0, accepted: 1, declined: 2, cancelled: 3 }

  def total_price
    number_of_days = end_date - start_date
    return (item.price * number_of_days).to_i
  end

  def min_days_rent
    if start_date && end_date && (end_date - start_date).to_i < item.min_days_rent
      errors.add(:end_date, "must be at least #{item.min_days_rent} days after the start date")
    end
  end
end
