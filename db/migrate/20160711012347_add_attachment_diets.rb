class AddAttachmentDiets < ActiveRecord::Migration
  def up
    add_attachment :diets, :image
  end

  def down
    remove_attachment :diets, :image
  end
end
