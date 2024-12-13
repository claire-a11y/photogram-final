class CreateFollowRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_requests do |t|
      t.integer :sender_id, null: false, foreign_key: true
      t.integer :recipient_id, null: false, foreign_key: true
      t.string :status, null: false

      t.timestamps
    end

    add_index :follow_requests, :sender_id
    add_index :follow_requests, :recipient_id
  end
end
