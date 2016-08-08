class UsersController < ApplicationController
  config.force_ssl = true
  http_basic_authenticate_with name:ENV["API_AUTH_NAME"], password:ENV["API_AUTH_PASSWORD"], :only => [:signup, :signin, :get_token]  
  before_filter :check_for_valid_authtoken, :except => [:signup, :signin, :get_token]
  
  DAY = (24*60*60)
  def index
    @user = current_user
  end

  def signin
    if request.post?
      
    end
  end

  def get_token
    # if params && params[:email]    
    #   user = User.where(:email => params[:email]).first
    
    #   if user 
    #     if !user.api_authtoken || (user.api_authtoken && user.authtoken_expiry < Time.now)          
    #       auth_token = rand_string(20)
    #       auth_expiry = Time.now + DAY
          
    #       user.update_attributes(:api_authtoken => auth_token, :authtoken_expiry => auth_expiry)                              
    #     end        
        
    #     render :json => user.to_json(:only => [:api_authtoken, :authtoken_expiry])                
    #   else
    #     e = Error.new(:status => 400, :message => "No user record found for this email ID")
    #     render :json => e.to_json, :status => 400
    #   end
      
    # else
    #   e = Error.new(:status => 400, :message => "required parameters are missing")
    #   render :json => e.to_json, :status => 400
    # end
  end

  def clear_token
    # if @user.api_authtoken && @user.authtoken_expiry > Time.now
    #   @user.update_attributes(:api_authtoken => nil, :authtoken_expiry => nil)
          
    #   m = Message.new(:status => 200, :message => "Token cleared")          
    #   render :json => m.to_json, :status => 200  
    # else
    #   e = Error.new(:status => 401, :message => "You don't have permission to do this task")
    #   render :json => e.to_json, :status => 401
    # end 
  end

  private 
  
  def check_for_valid_authtoken
    authenticate_or_request_with_http_token do |token, options|     
      @user = User.where(:api_authtoken => token).first      
    end
  end
  
  def rand_string(len)
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    string  =  (0..len).map{ o[rand(o.length)]  }.join

    return string
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_hash, :password_salt, :verification_code, 
    :email_verification, :api_authtoken, :authtoken_expiry)
  end
end
