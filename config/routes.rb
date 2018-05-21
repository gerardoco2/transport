Rails.application.routes.draw do
  
  
  
  resources :provinces do
    resources :cities, except: [:index]
  end



  resources :transport_types
  resources :service_types
  resources :orders
  resources :customers do 
  	resources :orders, except: [:index]
  end


  resources :drivers do 
  	resources :routes, except: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
