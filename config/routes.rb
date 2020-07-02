Rails.application.routes.draw do
  devise_for :admins
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
  namespace :admin do
  	get '/' => "home#top"
  	resources :items,only: [:index,:new,:create,:show,:edit,:update]
  	resources :genres,only: [:index,:create,:edit,:update]
  	resources :customers,only: [:index,:show,:edit,:update]
  	resources :orders,only: [:index,:show,:update]
  	resources :order_details,only: [:update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
