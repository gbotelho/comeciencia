class Person < ActiveRecord::Base
	has_one :user, dependent: :destroy
	has_many :diets, dependent: :destroy
	has_and_belongs_to_many :foods
	accepts_nested_attributes_for :user, :diets
end
