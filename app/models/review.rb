class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user

  validates :rating, :comment, presence: true
end
