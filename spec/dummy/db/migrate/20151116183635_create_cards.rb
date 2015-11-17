class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :original
      t.text :translated
      t.date :review
      t.integer :user_id, null: false
      t.integer :block_id, null: false

      t.timestamps null: false
    end
  end
end

