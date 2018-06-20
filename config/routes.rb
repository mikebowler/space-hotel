SpaceHotel::Application.routes.draw do
  root 'index#index'

  get "/:id", id: /\d+\-\w+/, to: 'index#change_session' 
  get "/options", to: 'option#index'

  match "/login", to: 'index#login', via: [:get, :post]
  get '/logoff', to: 'index#logoff'

  get "/my_reservations", to: 'index#my_reservations'
  post '/search', to: 'index#search'

  get "/sessions", to: 'session#index'
  get '/sessions/new', to: 'session#new'  
  post '/sessions/create', to: 'session#create'  
  
end
