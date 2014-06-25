require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)

    @valid_user = { username: 'validUser',
                    password: 'secret',
                    password_confirmation: 'secret',
                    surname: 'User',
                    firstname: 'Valid',
                    email: 'valid@user.com',
                    admin: false }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: @valid_user
    end

    assert_redirected_to users_path
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: @valid_user
    assert_redirected_to edit_user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
