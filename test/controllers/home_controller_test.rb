require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
  	session[:user_id] = users(:one)
    get :index
    assert_response :success
  end

end
