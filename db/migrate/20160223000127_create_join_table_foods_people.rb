class CreateJoinTableFoodsPeople < ActiveRecord::Migration
  def change
    create_join_table :foods, :people do |t|
      # t.index [:food_id, :person_id]
      # t.index [:person_id, :food_id]
    end
  end
end
