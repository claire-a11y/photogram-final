class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :author_id, null: false, foreign_key: true
      t.integer :photo_id, null: false, foreign_key: true

      t.timestamps
    end

    add_index :comments, :author_id
    add_index :comments, :photo_id
  end
end
