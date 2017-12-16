class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, index: true
      t.references :post, foreign_key: true, index: true

      t.timestamps
    end
    add_index :likes, [:user_id, :post_id], unique: true
    add_index :likes, :user_id
    add_index :likes, :post_id
  end
end
