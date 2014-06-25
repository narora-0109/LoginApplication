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
                    admin: false }
  end

  test "should get index" do
    session[:user_id] = @user.id
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test "should create user" do
    session[:user_id] = @user.id
    assert_difference('User.count') do
      post :create, user: @valid_user
    end

    assert_redirected_to users_path
  end

  test "should get edit" do
    session[:user_id] = @user.id
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    session[:user_id] = @user.id
    patch :update, id: @user, user: @valid_user
    assert_redirected_to edit_user_path(assigns(:user))
  end

  test "should destroy user" do
    session[:user_id] = @user.id
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
