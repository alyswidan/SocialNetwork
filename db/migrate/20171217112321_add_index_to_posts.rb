class AddIndexToPosts < ActiveRecord::Migration[5.1]
  def change

    add_column :posts,:user_id,:integer
    add_foreign_key :posts, :users,
                    column: :user_id,
                    primary_key: :id,
                    on_delete: :cascade

    add_index :posts, [:user_id, :created_at]
  end
end
