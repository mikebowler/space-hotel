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

  def admin_user?
    session[:userid] == 'admin'
  end

  def logged_in?
    session[:userid]
  end

  # Filter to allow access only to admins
  def admin_only
    unless admin_user?
      add_message 'Insufficient permission to view page'
      redirect_to '/'
    end
  end

  def add_message message
    (flash[:messages] ||= []) << message
  end

  def option_enabled? feature
    option = Option.find_by :key => feature.to_s
    value = OptionValue.find_by(
      :shared_session_id => @shared_session.id, :option_id => option.id
    )
    if value.nil?
      false
    else
      value.value == 'Y'
    end
  end
end
