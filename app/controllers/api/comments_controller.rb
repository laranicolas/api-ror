module Api
	class CommentsController < ApplicationController

		before_action :set_comment, only: [:show, :update, :destroy]

		rescue_from Pundit::NotAuthorizedError, :with => :permission_denied

		def index
			@comments = Comment.all
		end

		def show
			@comment = Comment.find(params[:id])
			if @comment.nil?
				render status: :no_content
			end
		end

		def create
			@comment = Comment.new(comment_params)

			if @comment.save
				render :show, status: :created, location: api_comment_url(@comment)
			else
				render json: @comment.errors, status: :unprocessable_entity
			end
		end

		def update
			@comment = Comment.find(params[:id])
			if @comment.update(comment_params)
				render :show, status: :ok, location: api_comment_url(@comment)
			else
				render json: @comment.errors, status: :unprocessable_entity
			end
		end

		def destroy
			@comment = Comment.find(params[:id])
			@comment.destroy
			head :no_content
		end

		private

			def set_comment
				@comment = Comment.find(params[:id] || params[:comment_id])
				authorize @comment
			end

			def comment_params
				params.require(:comment).permit(:body, :user_id, :blogPost_id)
			end
		
	end
end