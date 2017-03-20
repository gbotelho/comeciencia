class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.string :directions
      t.string :author
      t.string :tips

      t.timestamps null: false
    end
  end
end
