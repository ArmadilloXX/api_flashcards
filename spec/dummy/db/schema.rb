ActiveRecord::Schema.define(version: 20_151_116_184_551) do
  enable_extension "plpgsql"

  create_table "blocks", force: :cascade do |t|
    t.string "title", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.text "original_text"
    t.text "translated_text"
    t.date "review_date"
    t.integer "user_id", null: false
    t.integer "block_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
