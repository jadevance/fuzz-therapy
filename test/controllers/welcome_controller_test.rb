require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "get root path" do
    get '/'
    assert_response :success
  end
end
