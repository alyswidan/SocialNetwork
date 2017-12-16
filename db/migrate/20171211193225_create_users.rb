class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :nickname
      t.string :password_digest, null: false
      t.string :email, null: false, unique: true
      t.integer :gender,default: :not_specified
      t.integer :marital_status, default: :single
      t.date :birthdate, null:false
      t.text :about_me

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, [:first_name, :last_name]
  end
end
