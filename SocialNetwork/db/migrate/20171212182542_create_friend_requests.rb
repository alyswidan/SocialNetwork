class CreateFriendRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :friend_requests do |t|
      t.integer :user_id
      t.integer :other_user_id
      t.integer :state
      t.timestamps
    end
    add_index :friend_requests, [:user_id,:other_user_id ], unique: true
    add_foreign_key :friend_requests,
                    :users, column: :user_id,
                    primary_key: :id,
                    on_delete: :cascade
    add_foreign_key :friend_requests,
                    :users, column: :other_user_id,
                    primary_key: :id,
                    on_delete: :cascade
    add_index :friend_requests, :user_id
    add_index :friend_requests, :other_user_id
  end
end

