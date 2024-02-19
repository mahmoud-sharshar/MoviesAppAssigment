require 'csv'

namespace :import do
  desc "Import movies and reviews from CSV files"
  task movies_and_reviews: :environment do
    movies_csv_path = "csv/movies.csv"
    reviews_csv_path = "csv/reviews.csv"

    # Import movies
    puts "Importing movies..."
    import_movies(movies_csv_path)  

    # Import reviews
    puts "Importing reviews..."
    import_reviews(reviews_csv_path)

    puts "Import completed successfully!"
  end

  private

  def import_movies(file_path)
    movies = []
    CSV.foreach(file_path, headers: true) do |row|
      movie_params = row.to_hash.slice("Movie", "Description", "Year", "Director", "Actor", "Filming location", "Country")
      movies << {
        name: movie_params["Movie"],
        description: movie_params["Description"],
        year: movie_params["Year"],
        director_name: movie_params["Director"],
        actor_name: movie_params["Actor"],
        filming_location: movie_params["Filming location"],
        country: movie_params["Country"]
      }
    end
    Movie.import(movies)
    rescue StandardError => e
      log_error("Error importing movies:", e)
  end

  def import_reviews(file_path)
    reviews = []
    CSV.foreach(file_path, headers: true) do |row|
      review_params = row.to_hash.slice("Movie", "User", "Stars", "Review")
      movie = Movie.find_by(name: review_params["Movie"])
      reviews << {
        movie_id: movie&.id,
        user_name: review_params["User"],
        star: review_params["Stars"],
        review: review_params["Review"]
      }
    end
    Review.import(reviews)
    
    rescue StandardError => e
      log_error("Error importing review:", e)
  end

  def log_error(message, error)
    puts message
    puts "Error details: #{error.message}"
  end
end