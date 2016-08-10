class ApiController < ApplicationController

  def index
    if request.post?
      @userID = params 
      raise
      render json: [@userID]
    else
      render json: ["This is a response from the API. Hello!"]
    end 
  end 

end
