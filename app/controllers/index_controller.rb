class IndexController < ApplicationController

  def index
  end

  def change_session
    if params[:id] =~ /^(\d+)-(.+)$/
      id, alpha = $1.to_i, $2
      @shared_session = SharedSession.find_by_id id
      unless @shared_session.nil? || @shared_session.alpha_code != alpha
        add_message "Welcome to #{@shared_session.title}"
        session[:shared_session] = id
        initialize_shared_session
        return redirect_to '/'
      end
    end

    add_message "Session not found"
    session[:shared_session] = DEFAULT_SESSION
    initialize_shared_session
    redirect_to '/'
  end
end
