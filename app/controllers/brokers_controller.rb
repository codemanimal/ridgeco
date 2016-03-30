class BrokersController < ApplicationController

	before_filter :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

	# Routes to team#index

	def index
		@brokers = Broker.all

		# respond_to do |format|
		# 	format.html {}
		# 	format.json { render json: @brokers }
		# end
	end

	def show
		@broker = Broker.find(params[:id])

		# respond_to do |format|
		# 	format.html {}
		# 	format.json { render json: @broker }
		# end
	end

	def new
		@broker = Broker.new
	end

	def create
		@broker_params = params.require(:broker)
		      .permit(
		      	:username,
		      	:password,
		      	:password_confirmation,
		      	:is_admin,
		      	:first_name,
		      	:last_name,
		      	:portrait,
		      	:address,
		      	:city,
		      	:state,
		      	:zip,
		      	:cell,
		      	:office,
		      	:fax,
		      	:email,
		      	:about
		      	)
		@broker = Broker.new(@broker_params)
		@broker.save
		respond_to do |format|
			format.html { redirect_to brokers_path }
			format.json { render json: Broker.all }
		end
	end

	def edit
		@broker = Broker.find(params[:id])
	end

	def update
		@broker = Broker.find(params[:id])
		@broker_params = params[:broker]
		@broker.update({
			:username => @broker_params[:username],
			:password => @broker_params[:password],
			:password_confirmation => @broker_params[:password_confirmation],
			:is_admin => @broker_params[:is_admin],
			:first_name => @broker_params[:first_name],
			:last_name => @broker_params[:last_name],
			:portrait => @broker_params[:portrait],
			:address => @broker_params[:address],
			:city => @broker_params[:city],
			:state => @broker_params[:state],
			:zip => @broker_params[:zip],
			:cell => @broker_params[:cell],
			:office => @broker_params[:office],
			:fax => @broker_params[:fax],
			:email => @broker_params[:email],
			:about => @broker_params[:about]
		})
		respond_to do |format|
			format.html { redirect_to broker_path(@broker.id) }
			format.json { render json: @broker }
		end
	end

	def destroy
		@broker = Broker.find(params[:id])

		@broker.destroy

		respond_to do |format|
			format.html { redirect_to brokers_path }
			format.json { render json: @broker }
		end
	end

end