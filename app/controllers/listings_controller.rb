class ListingsController < ApplicationController

	before_filter :authorize_admin, only: [:edit, :update, :destroy]

	def new
		@listing = Listing.new
		@brokers = Broker.all
	end

	def create
		@brokers = Broker.all
		@listing_params = params.require(:listing)
		      .permit(
		      	:asset1,
						:asset2,
						:asset3,
						:asset4,
						:asset5,
						:asset6,
						:asset7,
						:asset8,
						:asset9,
						:asset10,
						:address,
						:name,
						:unit,
						:city,
						:state,
						:price,
						:listing_type,
						:bedroom,
						:bathroom,
						:sqft,
						:feature,
						:detail,
						:mls_id,
						:mls_url,
						:description,
						:is_sale,
						:is_rental,
						:is_development,
						:is_featured,
						:is_sold,
						:is_in_contract,
						:is_under_review
		      	)
		@listing = Listing.new(@listing_params)
		@listing.save
		params.each do |(key, value)|
			if Broker.exists?(username: key) && value == "true"
				@listing.brokers<<Broker.where(username: key)
			end
		end
		respond_to do |format|
			format.html { redirect_to root_path }
			format.json { render json: Listing.all }
		end
	end

	def edit
		@brokers = Broker.all
		@listing = Listing.find(params[:id])
	end

	def update
		@listing_params = params[:listing]
		@listing = Listing.find(params[:id])
		@listing.update({
			:asset1 => @listing_params[:asset1],
			:asset2 => @listing_params[:asset2],
			:asset3 => @listing_params[:asset3],
			:asset4 => @listing_params[:asset4],
			:asset5 => @listing_params[:asset5],
			:asset6 => @listing_params[:asset6],
			:asset7 => @listing_params[:asset7],
			:asset8 => @listing_params[:asset8],
			:asset9 => @listing_params[:asset9],
			:asset10 => @listing_params[:asset10],
			:address => @listing_params[:address],
			:name => @listing_params[:name],
			:unit => @listing_params[:unit],
			:city => @listing_params[:city],
			:state => @listing_params[:state],
			:price => @listing_params[:price],
			:listing_type => @listing_params[:listing_type],
			:bedroom => @listing_params[:bedrooms],
			:bathroom => @listing_params[:bathroom],
			:sqft => @listing_params[:sqft],
			:detail => @listing_params[:detail],
			:feature => @listing_params[:feature],
			:mls_id => @listing_params[:mls_id],
			:mls_url => @listing_params[:mls_url],
			:description => @listing_params[:description],
			:is_sale => @listing_params[:is_sale],
			:is_rental => @listing_params[:is_rental],
			:is_development => @listing_params[:is_development],
			:is_featured => @listing_params[:is_featured],
			:is_sold => @listing_params[:is_sold],
			:is_in_contract => @listing_params[:is_in_contract],
			:is_under_review => @listing_params[:is_under_review]
		})
		params.each do |(key, value)|
			if Broker.exists?(username: key) && value == "true"
				@listing.brokers<<Broker.where(username: key)
			end
		end
		respond_to do |format|
			format.html { redirect_to listings_path }
			format.json { render json: @listing }
		end
	end

	def destroy
		@listing = Listing.find(params[:id])

		@listing.destroy

		respond_to do |format|
			format.html { redirect_to root_path }
			format.json { render json: @listing }
		end
	end

end