class DevelopmentsController < ApplicationController

	before_filter :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
		@developments = Listing.all
		@developments = @developments.selected_price(params[:price].to_i) if params[:price].present?
		@developments = @developments.has_bedrooms(params[:bedrooms].to_i) if params[:bedrooms].present?
		@developments = @developments.has_bathrooms(params[:bathrooms].to_i) if params[:bathrooms].present?
	end

	def new
		@listing = Listing.new
		@brokers = Broker.all
	end

	def show
		@development = Listing.find(params[:id])
		@brokers = Broker.all
	end

	def edit
		@brokers = Broker.all
		@listing = Listing.find(params[:id])
	end

	def destroy
		@development = Listing.find(params[:id])

		@development.destroy

		respond_to do |format|
			format.html { redirect_to developments_path }
			format.json { render json: @development }
		end
	end

end