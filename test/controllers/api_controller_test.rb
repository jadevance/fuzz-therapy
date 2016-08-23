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
    }

    @user_modified_account = { 
      uid: "1234567890",
      name: "Awesomesauce McLadypants",
      location: "Bellingham",
      availability: "Sometimes",
      dog_name: "Harlz",
      dog_breed: "The best breed",
      dog_age: 10,
    }
  end
  
  teardown do
    Rails.cache.clear
  end

  test "get index" do
    post '/api', 
    params: {uid: '1234567890'}
    assert_response :success
  end

  test "post to index" do 
    post '/api', 
    params: {uid: '1234567890'}
    assert_response :success
  end 

  test "post to index user does not exist" do 
    post '/api', 
    params: {uid: '8675309'}
    assert_response :success
  end 

  test "post profile to create" do
    post '/api/create', 
    params: @user_account
    assert_response :success
  end

  test "User account increases by one when added" do 
    assert_difference('User.count', 1) do
      post "/api/create", params: @user_account
    end
  end

  test "update an account already created" do
    post '/api/create', params: @user_account
    put '/api/update', params: @user_modified_account
    assert_response :success
  end

  test "Search returns results" do 
    post '/api/search',
    params: {location: "Seattle"}
    assert_response :success
  end 

  test "Search returns no results if not in DB" do 
    post '/api/search',
    params: {location: "Kalamazoo"}
    assert_response :success
  end 


  test "should create image" do
    uid = "1234567890"
    image = fixture_file_upload('../fixtures/jadedog.png', 'image/png')
    post '/api/photo', params:{uid: uid, dog_picture: image}
    assert_response :success
  end
end
