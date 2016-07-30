class CreateFoodsPeople < ActiveRecord::Migration
  def change
    create_table :foods_people do |t|
	  t.integer :food_id
      t.integer :person_id
      t.boolean :like
      t.timestamps null: false
    end
  end
end
