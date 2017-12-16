class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :caption, null: false
      t.boolean :is_public, default:true

      t.timestamps
    end

  end
end
