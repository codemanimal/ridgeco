class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Routes to application#index
  	def current_user
    	Broker.find_by(id: session[:current_user]) 
  	end

	def authorize_admin
  	if current_user && current_user.is_admin
  		return true
  	elsif !current_user || !current_user.is_admin
    	redirect_to sessions_new_path, :status => 401
  	end
	end

  	def authenticate
    	redirect_to sessions_new_path unless current_user
  	end
    
end
