class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
      t.string :phone_number
      t.references :user, index: true

      t.timestamps
    end
     add_foreign_key :phones, :users
  end
end
