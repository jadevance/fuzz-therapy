class ApiController < ApplicationController

  def index
    render json: ["This is a response from the API. Hello!"]
  end 

end
