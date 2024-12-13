class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :encrypted_password, null: false
      t.boolean :private, default: false
      t.integer :comments_count, default: 0
      t.integer :likes_count, default: 0
      t.datetime :remember_created_at
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
