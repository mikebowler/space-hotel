require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should set session when given valid session code" do 
    get :change_session, :id => '123-abc'
    assert_redirected_to '/'
    assert_equal 123, session[:shared_session]
    assert_messages "Welcome to Class of 2400"
  end

  test "should revert to default session when given an invalid code" do 
    get :change_session, :id => '0-invalid'
    assert_redirected_to '/'
    assert_equal ApplicationController::DEFAULT_SESSION, session[:shared_session]
    assert_messages "Session not found"
  end

  test "should revert to default session when given an invalid alpha" do 
    get :change_session, :id => '1-invalid'
    assert_redirected_to '/'
    assert_equal ApplicationController::DEFAULT_SESSION, session[:shared_session]
    assert_messages "Session not found"
  end

end
