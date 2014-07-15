class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  DEFAULT_SESSION = 1

  before_filter :initialize_shared_session

  def initialize_shared_session
    id = session[:shared_session] || DEFAULT_SESSION
    @shared_session = SharedSession.find id.to_i
  end

  def add_message message
    (flash[:messages] ||= []) << message
  end
end
