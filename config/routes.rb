SpaceHotel::Application.routes.draw do
  get "session/index"
  get "index/index"

  get "/:id", :id => /\d+\-\w+/, :controller => 'index', :action => 'change_session' 
  get "/options", :controller => 'option', :action => 'index'
  post "/login", :controller => 'index', :action => 'login'
  get '/logoff', :controller => 'index', :action => 'logoff'
  get "/my_reservations", :controller => 'index', :action => 'my_reservations'
  post '/search', :controller => 'index', :action => 'search'

  get "/sessions", :controller => 'session', :action => 'index'
  get '/sessions/new', :controller => 'session', :action => 'new'  
  post '/sessions/create', :controller => 'session', :action => 'create'  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
