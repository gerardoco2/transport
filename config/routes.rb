Rails.application.routes.draw do
  
  
  

  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  root to: 'pages#main'

  resources :provinces do
    resources :cities, except: [:index]
  end



  resources :transport_types
  resources :service_types
  resources :orders
  
  get 'on_hold', to: 'orders#on_hold'
  get 'dispatch_room', to: 'orders#dispatch_room'

  
  get 'approve/:id', to: 'orders#approve', as: :approve
  get 'cancel/:id', to: 'orders#cancel', as: :cancel
  patch '/assign/:id', to: 'orders#assign', as: :assign
  #put '/assign/:id', to: 'orders#assign', as: :assign

  resources :customers do 
  	resources :orders, except: [:index]
  end


  resources :drivers do 
  	resources :routes, except: [:index]
    resources :orders, except: [:index]
  end


  get 'drivers/:id/update_orders', to: 'drivers#update_orders', as: :update_orders 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
