module ApplicationHelper
	def current_user
    	Broker.find_by(id: session[:current_user]) 
  	end

	def authorize_admin
    	if current_user && current_user.is_admin
    		return true
    	elsif !current_user || !current_user.is_admin
	    	redirect_to :back, :status => 401
    		return false
    	end
	end

  	def authenticate
    	redirect_to sessions_new_path unless current_user
  	end
end
