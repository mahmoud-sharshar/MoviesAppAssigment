class MovieLocation < ApplicationRecord
  belongs_to :movie
  has_many :location_actors
  has_many :actors, through: :location_actors
end
