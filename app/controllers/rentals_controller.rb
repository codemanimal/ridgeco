class RentalsController < ApplicationController

	before_filter :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
		@rentals = Listing.all
		@rentals = @rentals.selected_price(params[:price].to_i) if params[:price].present?
		@rentals = @rentals.has_bedrooms(params[:bedrooms].to_i) if params[:bedrooms].present?
		@rentals = @rentals.has_bathrooms(params[:bathrooms].to_i) if params[:bathrooms].present?
	end

	def new
		@listing = Listing.new
		@brokers = Broker.all
	end

	def show
		@rental = Listing.find(params[:id])
		@brokers = Broker.all
	end

	def edit
		@brokers = Broker.all
		@listing = Listing.find(params[:id])
	end

	def destroy
		@rental = Listing.find(params[:id])

		@rental.destroy

		respond_to do |format|
			format.html { redirect_to rentals_path }
			format.json { render json: @rental }
		end
	end

end