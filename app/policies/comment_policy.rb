class CommentPolicy < Struct.new(:user, :comment)

	def owned
		comment.user_id == user.id
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