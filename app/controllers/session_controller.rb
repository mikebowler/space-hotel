class SessionController < ApplicationController
  def index
    @shared_sessions = SharedSession.all
  end
end
