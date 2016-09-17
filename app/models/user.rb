class User < ActiveRecord::Base
	require 'digest/sha1'

	attr_accessor :password
	belongs_to :person
	validates :email, presence: true, uniqueness: {message: "already subscribed"}
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :password, :confirmation => true #password_confirmation attr
 	validates_length_of :password, :in => 6..20, :on => :create


 	before_save :encrypt_password
	after_save :clear_password
	def encrypt_password
	  if password.present?
	    self.salt = BCrypt::Engine.generate_salt
	    self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
	  end
	end
	def clear_password
	  self.password = nil
	end

	def self.authenticate(email, password)
		user = User.where(email: email).first
		if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.salt)
			user
		else
			nil
		end
	end
end
