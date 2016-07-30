class Person < ActiveRecord::Base
	has_one :user, dependent: :destroy
	has_many :diets, dependent: :destroy
	has_many :foods_person
	has_many :foods, :through => :foods_person
	accepts_nested_attributes_for :user, :diets
	validates :height, :weight, :age, :sex, presence: true
	validates :height, :numericality => { :greater_than => 0, :less_than_or_equal_to => 3 }
	validates :weight, :numericality => { :greater_than => 0, :less_than_or_equal_to => 300 }
	validates :age, :numericality => { :greater_than => 0, :less_than_or_equal_to => 150 }
end
