class WelcomeController < ApplicationController
	respond_to :html
	skip_before_filter :authenticate_token!, only: [:index]

	def index
	end
end