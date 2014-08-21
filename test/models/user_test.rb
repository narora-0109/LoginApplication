require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @valid_users = [ users(:one), users(:two) ]

    @invalid_users = [
      User.new(username: users(:one).username, password: 'secret', password_confirmation: 'secret', surname: "Mustermann", firstname: "Manfred", email: "manfred@mustermann.de"),
      User.new(password: 'secret', password_confirmation: 'secret', surname: "Mustermann", firstname: "Manfred", email: "manfred@mustermann.de"),
      User.new(username: "manfred", password_confirmation: 'secret', surname: "Mustermann", firstname: "Manfred", email: "manfred@mustermann.de"),
      User.new(username: "manfred", password: 'secret', password_confirmation: 'wrong', surname: "Mustermann", firstname: "Manfred", email: "manfred@mustermann.de"),
      User.new(username: "manfred", password: 'secret', password_confirmation: 'secret', firstname: "Manfred", email: "manfred@mustermann.de"),
      User.new(username: "manfred", password: 'secret', password_confirmation: 'secret', surname: "Mustermann", email: "manfred@mustermann.de"),
      User.new(username: "manfred", password: 'secret', password_confirmation: 'secret', surname: "Mustermann", firstname: "Manfred", email: "manfred@mustermann"),
      User.new(username: "manfred", password: 'secret', password_confirmation: 'secret', surname: "Mustermann", firstname: "Manfred", email: users(:one).email),
      User.new,
    ]
  end

  test 'save valid users' do
    @valid_users.each do |user|
      assert user.save
    end
  end

  test 'dont save invalid users' do
    @invalid_users.each do |user|
      assert_not user.save, 'Saved an invalid user'
    end
  end

  test 'should not delete last admin' do 
    assert_not users(:one).destroy, "Could delete last admin"
  end
end