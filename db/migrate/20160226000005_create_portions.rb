class CreatePortions < ActiveRecord::Migration
  def change
    create_table :portions do |t|
      t.belongs_to :food, index:true
      t.float :size

      t.timestamps null: false
    end
  end
end
