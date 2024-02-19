class CreateLocationsDirectorsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :location_actors, :id => false do |t|
      t.references :movie_location, null: false, foreign_key: true
      t.references :actor, null: false, foreign_key: { to_table: :users }
    end
  end
end
