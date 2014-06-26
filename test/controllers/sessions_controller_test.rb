require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    usr = users(:one)
    post :create, username: usr.username, password: 'secret'
    assert_redirected_to home_url
    assert_equal usr.id, session[:user_id]
  end

  test "should fail login" do
    user = users(:one)
    post :create, username: user.username, password: 'wrong'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to login_url
  end

end
