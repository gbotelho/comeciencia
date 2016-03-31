class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.float :size
      t.float :calories
      t.float :protein
      t.float :carbohydrate
      t.float :fat
      t.boolean :high_protein
      t.boolean :high_carbohydrate
      t.boolean :high_fat
      t.boolean :breakfast
      t.boolean :lunch
      t.boolean :dinner
      t.boolean :snack

      t.timestamps null: false
    end
  end
end
