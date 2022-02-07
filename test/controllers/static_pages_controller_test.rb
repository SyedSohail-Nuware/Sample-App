require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @msg = 'Ruby on Rails Tutorial Sample App'    
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | #{@msg}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@msg}"
    end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@msg}"
    end

  test "should get contacts" do
    get contacts_path
    assert_response :success
    assert_select "title", "Contact | #{@msg}"
    end
  
end
