class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :other_user_id
      t.integer :state
      t.timestamps
    end
    add_index :friends, [:user_id,:other_user_id ], unique: true
    add_foreign_key :friends, :users, column: :user_id, primary_key: :id,on_delete: :cascade
    add_foreign_key :friends, :users, column: :other_user_id, primary_key: :id,on_delete: :cascade
    add_index :friends, :user_id
    add_index :friends, :other_user_id
  end
end
