module Api
	class UsersController < ApplicationController

		def index
			@users = User.all
		end

		def show
			@user = User.find(params[:id])
		end

		def create
			@user = User.new(user_params)

			if @user.save
				render :show, status: :created, location: api_user_url(@user)
			else
				render json: @user.errors, status: :unprocessable_entity
			end
		end

		def update
			@user = User.find(params[:id])
			if @user.update(user_params)
				render :show, status: :ok, location: api_user_url(@user)
			else
				render json: @user.errors, status: :unprocessable_entity
			end
		end

		def destroy
			@user = User.find(params[:id])
			@user.destroy
			head :no_content
		end

		private

			def user_params
				params.require(:user).permit(:name, :email, :password)
			end
	end
end