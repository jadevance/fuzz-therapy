class WelcomeController < ApplicationController
  config.force_ssl = true
  
  def index
    render json: ["hello, world!! Dogs are best."]
  end
end
