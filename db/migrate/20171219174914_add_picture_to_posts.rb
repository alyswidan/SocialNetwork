class AddPictureToPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :picture
    add_column :posts, :picture, :string
  end
end
