require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  test "should get index" do
    session[:userid] = 'admin'
    get :index
    assert_response :success
  end

  test "should get redirect if not the admin" do
    session[:userid] = 'amy'
    get :index
    assert_redirected_to '/'
  end
end
