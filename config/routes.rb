Mozapolis::Application.routes.draw do

  devise_for :users
  
  resources :users do
    resources :microposts
    resources :events, :shallow => true
    resources :photos, :shallow => true
    resources :albums, :shallow => true do
      resources :songs
    end
  end
  
  root :to => 'pages#home'

  match '/about'         => 'pages#about',        as: 'about'
  match '/team'          => 'pages#team',         as: 'team'
  match '/contact'       => 'pages#contact',      as: 'contact'
  match '/how-it-works'  => 'pages#how_it_works', as: 'how_it_works'
  match '/music'         => 'pages#music'
  match '/dashboard'          => 'users#dashboard'
  match '/song-dashboard'     => 'users#songdashboard',    as: 'song_dashboard'
  match '/gallery-dashboard'  => 'users#gallerydashboard', as: 'gallery_dashboard'
  match '/album-dashboard'    => 'users#albumdashboard',   as: 'album_dashboard'
  match '/events-dashboard'    => 'users#eventsdashboard',   as: 'events_dashboard'

  match '/settings' => 'settings#edit'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
