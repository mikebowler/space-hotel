class SessionController < ApplicationController
  before_action :admin_only
  
  def index
    @shared_sessions = SharedSession.all
  end
end
