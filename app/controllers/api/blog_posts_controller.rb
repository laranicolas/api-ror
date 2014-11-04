module Api
	class BlogPostsController < ApplicationController

		before_action :set_blog_post, only: [:show, :update, :destroy]

		rescue_from Pundit::NotAuthorizedError, :with => :permission_denied

		def index
			@blog_posts = BlogPost.all
		end

		def show
			@blog_post = BlogPost.find(params[:id])
			if @blog_post.nil?
				render status: :no_content
			end
		end

		def create
			@blog_post = BlogPost.new(blog_post_params)

			if @blog_post.save
				render :show, status: :created, location: api_blog_post_url(@blog_post)
			else
				render json: @blog_post.errors, status: :unprocessable_entity
			end
		end

		def update
			@blog_post = BlogPost.find(params[:id])
			if @blog_post.update(blog_post_params)
				render :show, status: :ok, location: api_blog_post_url(@blog_post)
			else
				render json: @blog_post.errors, status: :unprocessable_entity
			end
		end

		def destroy
			@blog_post = BlogPost.find(params[:id])
			@blog_post.destroy
			head :no_content
		end

		private

			def set_blog_post
				@blog_post = BlogPost.find(params[:id] || params[:blog_post_id])
				authorize @blog_post
			end

			def blog_post_params
				params.require(:blog_post).permit(:title, :body, :user_id)
			end
	end
end