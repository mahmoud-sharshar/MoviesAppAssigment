class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :movie, null: false, foreign_key: true
      t.string :user_name
      t.integer :star
      t.string :review

      t.timestamps
    end
  end
end
