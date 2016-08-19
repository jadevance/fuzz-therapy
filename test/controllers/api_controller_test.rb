require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  require 'test_helper'

  setup do
    @user = user(:first_account)
    
    @user_account = { 
      uid: "1234567890",
      name: "Awesomesauce McLadypants",
      location: "Seattle",
      availability: "Always",
      dog_name: "Harlz",
      dog_breed: "The best breed",
      dog_age: 10,
      dog_picture_file_name: "dog.jpg",
      dog_picture_content_type: "image",
      dog_picture_file_size: 12345,
      dog_picture_url: "http://www.puppies.com/puppy.jpg"
    }
  end
  
  teardown do
    Rails.cache.clear
  end

  test "get index" do
    get '/api'
    assert_response :success
  end

  test "post profile to create" do
    post '/api/create', 
    params: @user_account
    assert_response :success
  end
end
