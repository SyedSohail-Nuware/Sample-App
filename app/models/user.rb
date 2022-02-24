class User < ApplicationRecord
	has_many :microposts, dependent: :destroy
	has_many :active_relationships, class_name: "Relationship",foreign_key: "follower_id",dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :microposts

	attr_accessor :remember_token
	
	before_save {email.downcase }
  validates :name,  presence: true ,length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
							format: { with: VALID_EMAIL_REGEX },
							uniqueness: { case_sensitive: false }
							# uniqueness: true
							# case_sensitive: false
							# uniqueness:	case_sensitive: false
							
							has_secure_password
	validates :password, presence: true, length: {minimum:6},allow_nil: true

	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ?
		BCrypt::Engine::MIN_COST :
		BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def self.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token 
		# update_attribute(:remember_digest, User.digest(remember_token))
		# remember_digest
	end

	def forget
		# update_attribute(:remember_digest, nil)
	end

	def authenticated?(remember_token)
		
	end

	def feed
		following_ids = "SELECT followed_id FROM relationships
		WHERE  follower_id = :user_id"
		Micropost.where("user_id IN (#{following_ids})
		OR user_id = :user_id", user_id: id)
	end

	# Follows a user.
	def follow(other_user)
		following << other_user
	end
	# Unfollows a user.
	def unfollow(other_user)
		following.delete(other_user)
	end
	# Returns true if the current user is following the otheruser.
	def following?(other_user)
		following.include?(other_user)
	end
end
