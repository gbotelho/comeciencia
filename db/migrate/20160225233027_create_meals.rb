class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.float :calories
      t.float :protein_percentage
      t.float :carbohydrate_percentage
      t.float :fat_percentage
      t.time :time

      t.timestamps null: false
    end
  end
end
