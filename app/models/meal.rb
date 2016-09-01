class Meal < ActiveRecord::Base
	has_and_belongs_to_many :portions
	has_and_belongs_to_many :diets
	accepts_nested_attributes_for :portions
end
