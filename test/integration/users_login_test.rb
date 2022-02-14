require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:syed)
  end

  test "login with valid email/invalid password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @user.email, password: 'password'} }
    assert_template 'sessions/new' 
    assert_not flash.empty?
    get root_path
    assert flash.empty?
    
  end
end
