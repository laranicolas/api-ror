class BlogPostPolicy < Struct.new(:user, :blog_post)

	def owned
		blog_post.user_id == user.id
	end

	def index?
		true
	end

	def show?
		true
	end

	def create?
		new?
	end

	def new?
		true
	end

	def update?
		edit?
	end

	def edit?
		owned
	end

	def destroy?
		owned
	end
end