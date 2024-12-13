class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.text :caption
      t.string :image, null: false
      t.integer :owner_id, null: false, foreign_key: true
      t.integer :comments_count, default: 0
      t.integer :likes_count, default: 0

      t.timestamps
    end

    add_index :photos, :owner_id
  end
end
