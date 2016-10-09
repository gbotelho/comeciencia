class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :person, index: true
      t.string :email
      t.string :encrypted_password 
      t.string :salt
      t.string :user_type

      t.timestamps null: false
    end
  end
end
