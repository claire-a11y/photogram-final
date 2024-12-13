class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :fan_id, null: false, foreign_key: true
      t.integer :photo_id, null: false, foreign_key: true

      t.timestamps
    end

    add_index :likes, :fan_id
    add_index :likes, :photo_id
  end
end
