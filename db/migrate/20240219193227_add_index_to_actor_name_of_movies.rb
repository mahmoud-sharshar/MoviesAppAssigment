class AddIndexToActorNameOfMovies < ActiveRecord::Migration[7.1]
  def change
    add_index :movies, :actor_name
  end
end
