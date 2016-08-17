class ApiController < ApplicationController
  # force_ssl
  skip_before_action :verify_authenticity_token
  
  def index
    if request.post?
      @userID = params[:uid]
      user = User.find_user(@userID)
      if user.nil? 
        render json: ["user: does not exist"]
      else 
        render json: [user]
      end
    else
      render json: ["This is a GET response from the API. Hello!"]
    end 
  end 

  def create
    if request.post? 
      user_profile = User.create_new_account(params) 
      if user_profile.nil? 
        render json: ["status: account did not save, please try again later"]
      else 
        render json: [user_profile]
      end
    else 
      render json: ["This is a GET response from the API. Hello!"]
    end
  end 

  def photo
    user = User.find_user("12345")
    user.dog_picture = params[:dog_picture]
    user.save! 
    render json: [user.dog_picture.url] 
  end 

end
