require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
  	session[:user_id] = users(:one)
    get :index
    assert_response :success
  end

  test "should not get index" do 
    session[:user_id] = nil
    get :index
    assert_redirected_to login_path
  end
end