class Log < ApplicationRecord
  # belongs_to :user

  # validates :request, presence: true
  # validates :response, presence: true

  # def self.create_by(request, response)
  #   log = Log.new
  #   log.request  = request.body.read
  #   log.response = response.body
  #   if log.save
  #     return log 
  #   end 
  # end 
end