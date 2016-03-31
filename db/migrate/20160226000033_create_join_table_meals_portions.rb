class CreateJoinTableMealsPortions < ActiveRecord::Migration
  def change
    create_join_table :meals, :portions do |t|
      # t.index [:meal_id, :portion_id]
      # t.index [:portion_id, :meal_id]
    end
  end
end
