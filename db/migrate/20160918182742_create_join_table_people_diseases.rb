class CreateJoinTablePeopleDiseases < ActiveRecord::Migration
  def change
    create_join_table :people, :diseases do |t|
      # t.index [:person_id, :disease_id]
      # t.index [:disease_id, :person_id]
    end
  end
end
