require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)

    @valid_user = { username: 'validUser',
                    password: 'secret',
                    password_confirmation: 'secret',
                    surname: 'User',
                    firstname: 'Valid',
                    email: 'valid@user.de',
                    admin: true }
  end

  test "should get index" do
    session[:user_id] = users(:one).id
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should not get index" do 
    get :index
    assert_redirected_to login_path

    session[:user_id] = users(:two).id
    get :index
    assert_redirected_to home_path
  end

  test "should get new" do
    session[:user_id] = users(:one).id
    get :new
    assert_response :success
  end

  test "should not get new" do
    get :new
    assert_redirected_to login_path

    session[:user_id] = users(:two).id
    get :new
    assert_redirected_to home_path
  end

  test "should create user" do
    session[:user_id] = users(:one).id
    assert_difference('User.count') do
      post :create, user: @valid_user
    end

    assert_redirected_to users_path
  end

  test "should not create user" do
    post :create, user: @valid_user
    assert_redirected_to login_path

    session[:user_id] = users(:two).id
    post :create, user: @valid_user
    assert_redirected_to home_path
  end

  test "should get edit" do
    session[:user_id] = users(:one).id
    get :edit, id: users(:two)
    assert_response :success
  end

  test "should not get edit" do
    get :edit, id: users(:one)
    assert_redirected_to login_path

    session[:user_id] = users(:two).id
    get :edit, id: users(:one)
    assert_redirected_to home_path
  end

  test "should get settings" do
    session[:user_id] = users(:two)
    get :edit, id: users(:two)
    assert_response :success
  end

  test "should update user" do
    session[:user_id] = users(:one).id
    patch :update, id: users(:one), user: @valid_user
    assert_redirected_to edit_user_path(assigns(:user))
  end

  test "should not update user" do
    patch :update, id: users(:one), user: @valid_user
    assert_redirected_to login_path

    session[:user_id] = users(:two).id
    patch :update, id: users(:one), user: @valid_user
    assert_redirected_to home_path
  end

  test "should update settings" do 
    session[:user_id] = users(:two).id
    patch :update, id: users(:two), user: @valid_user
    assert_redirected_to edit_user_path(assigns(:user))
  end

  test "should destroy user" do
    session[:user_id] = users(:one).id
    assert_difference('User.count', -1) do
      delete :destroy, id: users(:two)
    end

    assert_redirected_to users_path
  end

  test "should not destroy user" do
    delete :destroy, id: users(:two)
    assert_redirected_to login_path

    session[:user_id] = users(:two).id
    delete :destroy, id: users(:two)
    assert_redirected_to home_path
  end
end