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
        session[:userid] = nil
        return redirect_to '/'
      end
    end

    add_message "Session not found"
    session[:shared_session] = DEFAULT_SESSION
    initialize_shared_session
    redirect_to '/'
  end

  def login
    if params[:password] == 'topsecret'
      session[:userid] = params[:userid]
    end
    add_message "Welcome back #{params[:userid]}"
    redirect_to '/'
  end

  def logoff
    session[:userid] = nil
    add_message 'Logged off'
    redirect_to '/'
  end

  def my_reservations
    if session[:userid] == 'amy'
      @reservations = [
        {:location => 'Mercury', :start => '2145-04-01', :nights => 5},
        {:location => 'Venus', :start => '2140-02-29', :nights => 1, :instructions => 'upgrade requested'}
      ]
    else
      @reservations = []
    end
  end

  def search
    @planet = params[:planet]
    render :layout => false
  end
end
