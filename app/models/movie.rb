class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy

  def self.sorted_by_average_stars
    left_joins(:reviews)
      .group(:id)
      .select("movies.*, AVG(reviews.star) AS average_stars")
      .order("AVG(reviews.star) DESC")
  end

  def average_stars
    reviews.average(:star)
  end
end
