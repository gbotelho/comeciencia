class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_attached_file :image, default_url: "missing.jpg"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :title, presence: true,
                    length: { minimum: 5 }
end
