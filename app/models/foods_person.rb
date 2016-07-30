class FoodsPerson < ActiveRecord::Base
	belongs_to :food
  	belongs_to :person
end
