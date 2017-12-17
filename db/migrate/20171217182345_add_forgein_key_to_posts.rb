class AddForgeinKeyToPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts,:user_id
    add_column :posts,
               :user_id,
               :integer
    add_foreign_key :posts,
                    :users,
                    on_delete: :cascade
  end
end
