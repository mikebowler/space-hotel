class SessionController < ApplicationController
  before_filter :admin_only
  
  def index
    @shared_sessions = SharedSession.all
  end
end
