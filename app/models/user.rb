class User < ApplicationRecord
	attr_accessor :remember_token
	before_create :create_session_token
	validates :password, length: { minimum: 6 }

	has_secure_password
	has_many :posts

	# Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
	end
	
	def User.digest(string)
    Digest::SHA1.hexdigest string
  end

	def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
	end
	
	def create_session_token
		self.remember_token = User.new_token
		self.remember_digest = User.digest(self.remember_token)
	end

	# Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
	end
	
	def to_s
		"#{self.name} as #{self.username}"
	end
end
