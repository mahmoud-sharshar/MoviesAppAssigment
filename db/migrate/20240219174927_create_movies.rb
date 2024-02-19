class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.string :year
      t.string :director_name
      t.string :actor_name
      t.string :filming_location
      t.string :country

      t.timestamps
    end
  end
end
