class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable

	has_many :blog_posts, inverse_of: :user, dependent: :destroy, autosave: true
	has_many :comments, inverse_of: :user, dependent: :destroy, autosave: true

	validates_presence_of :email, :password
	validates_uniqueness_of :email

	before_save :ensure_token

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && BCrypt::Password.new(user.password) == password
			user.reset_token!
			user
		else
			nil
		end
	end

	def password=(secret)
		write_attribute(:password, BCrypt::Password.create(secret))
	end

	def ensure_token
		if token.blank?
			self.token = generate_token
		end
	end

	def reset_token!
		self.token = generate_token
		self.save
	end

	private

		def generate_token
			loop do
				token = SecureRandom.urlsafe_base64(nil, false)
				break token unless User.find_by_token(token)
			end
		end
end
