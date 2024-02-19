class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.string :year
      t.references :director, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
