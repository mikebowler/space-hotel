require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should set session when given valid session code" do 
    get :change_session, params: { id: '123-abc' }
    assert_redirected_to '/'
    assert_equal 123, session[:shared_session]
    assert_messages "Welcome to Class of 2400"
  end

  test "should revert to default session when given an invalid code" do 
    get :change_session, params: { id: '0-invalid' }
    assert_redirected_to '/'
    assert_equal ApplicationController::DEFAULT_SESSION, session[:shared_session]
    assert_messages "Session not found"
  end

  test "should revert to default session when given an invalid alpha" do 
    get :change_session, params: { id: '1-invalid' }
    assert_redirected_to '/'
    assert_equal ApplicationController::DEFAULT_SESSION, session[:shared_session]
    assert_messages "Session not found"
  end

  test "option id_on_messages when it's enabled" do
    set_option_value ApplicationController::DEFAULT_SESSION, :id_on_messages, 'Y'
    get :index, flash: { messages: ['Testing123'] }

    assert_match(/id="message_list"/, @response.body)
    assert_match(/<li>Testing123<\/li>/, @response.body)
  end

end
