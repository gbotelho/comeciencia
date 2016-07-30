class Food < ActiveRecord::Base
	#attr_accessor :like
	has_and_belongs_to_many :diets
	has_many :foods_person
	has_many :people, :through => :foods_person
	has_attached_file :image, default_url: "missing.jpg"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
