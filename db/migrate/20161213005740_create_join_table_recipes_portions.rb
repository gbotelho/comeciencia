class CreateJoinTableRecipesPortions < ActiveRecord::Migration
  def change
    create_join_table :recipes, :portions do |t|
      # t.index [:recipe_id, :portion_id]
      # t.index [:portion_id, :recipe_id]
    end
  end
end
