class User < ActiveRecord::Base
	belongs_to :person
	validates :email, presence: true, uniqueness: {message: "already subscribed"}
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
