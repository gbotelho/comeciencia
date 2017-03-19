class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_attached_file :image, default_url: "missing.jpg",
					    :styles => {
					      :thumb => "100x100#",
					      :small  => "150x150#",
					      :medium => "200x200#",
					      :large => "800x800#",
					      :extralarge => "1600x900#" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :title, presence: true,
                    length: { minimum: 1 }
end
