Rails.application.routes.draw do
  root to: 'application#index'


  # Make available necessary 'about' routes
  get 'about' => 'about#index'


  # Make available necessary 'team' routes
  resources :brokers

  get 'team' => 'brokers#index'
  get 'team/:id' => 'brokers#show'
  get 'team/new' => 'brokers#new'
  get 'team' => 'brokers#create'
  get '/team/:id/edit' => 'brokers#edit'
  put '/team/:id' => 'brokers#update'
  delete '/team/:id' => 'brokers#destroy'


  # Make available necessary 'contact' routes
  get 'contact' => 'contact#index'

  # Make available necessary test contact submit routes
  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]
  

  # Make available necessary 'rental', 'sale', and 'development' routes
  resources :listings
  
  get 'developments' => 'developments#index'
  get 'developments/new' => 'developments#new'
  get 'developments/:id' => 'developments#show'
  get 'developments' => 'developments#create'
  get 'developments/:id/edit' => 'developments#edit'
  put '/deveopments/:id' => 'developments#update'
  delete '/developments/:id' => 'developments#destroy'

  get '/policies/privacy', to: 'policies#privacy_policy'

  get 'rentals' => 'rentals#index'
  get 'rentals/new' => 'rentals#new'
  get 'rentals/:id' => 'rentals#show'
  get 'rentals' => 'rentals#create'
  get 'rentals/:id/edit' => 'rentals#edit'
  put '/rentals/:id' => 'rentals#update'
  delete '/rentals/:id' => 'rentals#destroy'

  get 'sales' => 'sales#index'
  get 'sales/new' => 'sales#new'
  get 'sales/:id' => 'sales#show'
  get 'sales' => 'sales#create'
  get 'sales/:id/edit' => 'sales#edit'
  put '/sales/:id' => 'sales#update'
  delete '/sales/:id' => 'sales#destroy'


  # login form
  get '/sessions/new' => 'sessions#new'
  # actually logging in the user
  post 'sessions' => 'sessions#create'
  # logging out the user
  delete 'sessions' => 'sessions#destroy'
  
end
