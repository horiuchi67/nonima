Rails.application.routes.draw do
  devise_for :customers
  resources :customers,only: [:show,:edit,:update]
  get '/customers/:id/leave' => "customers#leave"
  patch '/customers/:id/hide' => "customers#hide"
  resources :cart_items,only: [:index,:create,:destroy,:update]
  delete '/cart_items' => "cart_items#reset"
  get '/items/:genre_id/search' => "items#search"
  resources :items,only: [:index,:show]
  resources :addresses,only: [:new,:create,:edit,:update,:destroy]
  post '/orders/confirm' => "orders#confirm"
  get '/orders/complete' => "orders#complete"
  post '/orders/complete' => "orders#create"
  resources :orders,only: [:new,:create,:index,:show]
  root to: 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
