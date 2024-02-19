class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :director, class_name: "User"
  has_many :movie_locations
  has_many :locations, class_name: "MovieLocation"
  has_many :actors, through: :movie_locations

  def self.sorted_by_average_stars
    left_joins(:reviews)
      .group(:id)
      .select("movies.*, AVG(reviews.star) AS average_stars")
      .order("AVG(reviews.star) DESC")
  end

  def self.search_by_actor(actor_name)
    partial_actor_name = "%#{actor_name}%"
    Movie.joins(:actors).where("users.name LIKE ?", partial_actor_name).distinct
  end

  def average_stars
    reviews.average(:star)
  end
end
