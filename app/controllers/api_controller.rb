class ApiController < ApplicationController
  force_ssl
  def index
    if request.post?
      @userID = params[:user]
      user = User.find_user(@userID)
      render json: [user]
    else
      render json: ["This is a response from the API. Hello!"]
    end 
  end 

  def create
    if request.post? 
      user_info = params
      user_profile = User.create_new_account(params) 
      render json: [user_info]
    else 
      render json: ["This is a response from the API. Hi!!"]
    end
  end 

end
