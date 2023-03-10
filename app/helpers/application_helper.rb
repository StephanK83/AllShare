module ApplicationHelper
  def star_rating(rating)
    full_stars = '★' * rating.floor
    half_star = (rating - rating.floor >= 0.5) ? '½' : ''
    empty_stars = '☆' * (5 - rating.ceil)

    full_stars + half_star + empty_stars
  end
end
