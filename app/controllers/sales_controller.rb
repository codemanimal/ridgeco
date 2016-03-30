class SalesController < ApplicationController

	before_filter :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
		@sales = Listing.all
		@sales = @sales.selected_price(params[:price].to_i) if params[:price].present?
		@sales = @sales.has_bedrooms(params[:bedrooms].to_i) if params[:bedrooms].present?
		@sales = @sales.has_bathrooms(params[:bathrooms].to_i) if params[:bathrooms].present?
	end

	def new
		@listing = Listing.new
		@brokers = Broker.all
	end

	def show
		@sale = Listing.find(params[:id])
		@brokers = Broker.all
	end

	def edit
		@brokers = Broker.all
		@listing = Listing.find(params[:id])
	end

	def destroy
		@sale = Listing.find(params[:id])

		@sale.destroy

		respond_to do |format|
			format.html { redirect_to sales_path }
			format.json { render json: @sale }
		end
	end

end