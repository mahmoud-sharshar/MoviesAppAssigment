class LocationActor < ApplicationRecord
    belongs_to :movie_location
    belongs_to :actor, class_name: "User"
end
  