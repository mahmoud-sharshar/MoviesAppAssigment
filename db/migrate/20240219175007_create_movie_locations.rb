class CreateMovieLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :movie_locations do |t|
      t.string :city
      t.string :country
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
