class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.belongs_to :person, index:true
      t.string :goal
      t.float :calories
      t.float :protein_percentage
      t.float :carbohydrate_percentage
      t.float :fat_percentage

      t.timestamps null: false
    end
  end
end
