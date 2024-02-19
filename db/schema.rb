# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_19_182539) do
  create_table "location_actors", id: false, force: :cascade do |t|
    t.integer "movie_location_id", null: false
    t.integer "actor_id", null: false
    t.index ["actor_id"], name: "index_location_actors_on_actor_id"
    t.index ["movie_location_id"], name: "index_location_actors_on_movie_location_id"
  end

  create_table "movie_locations", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.integer "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movie_locations_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "year"
    t.integer "director_id"
    t.string "filming_location"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["director_id"], name: "index_movies_on_director_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.string "user_name"
    t.integer "star"
    t.string "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "location_actors", "movie_locations"
  add_foreign_key "location_actors", "users", column: "actor_id"
  add_foreign_key "movie_locations", "movies"
  add_foreign_key "movies", "users", column: "director_id"
  add_foreign_key "reviews", "movies"
end
