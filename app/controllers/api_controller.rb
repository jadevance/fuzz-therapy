class ApiController < ApplicationController

  def index
    if request.post?
      userID = params[:user]
      user = User.find_user(userID)
      render json: [user]
    else
      render json: ["This is a response from the API. Hello!"]
    end 
  end 

end


# separate out find and create methods 
