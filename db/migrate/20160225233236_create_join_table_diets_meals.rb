class CreateJoinTableDietsMeals < ActiveRecord::Migration
  def change
    create_join_table :diets, :meals do |t|
      # t.index [:diet_id, :meal_id]
      # t.index [:meal_id, :diet_id]
    end
  end
end
