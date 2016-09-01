class Diet < ActiveRecord::Base
	belongs_to :person
	has_and_belongs_to_many :meals
	has_and_belongs_to_many :foods
	has_attached_file :image, default_url: "missing.jpg"
	accepts_nested_attributes_for :meals
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
#	validates :goal, presence: true
	validate :percentages_must_sum_up_100

	def percentages_must_sum_up_100
		if (carbohydrate_percentage != nil && protein_percentage != nil && fat_percentage != nil)
		    if (((carbohydrate_percentage + protein_percentage + fat_percentage) - 100.0 > 0.01 ) || 
		    	((carbohydrate_percentage + protein_percentage + fat_percentage) - 100.0 < - 0.01 ))
		      errors.add(:base, "A soma das % precisa totalizar 100%.")
		    end
		end
  end
end
