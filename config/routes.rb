Rails.application.routes.draw do
  get 'top' => "home#top"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "/logout" => "users#logout"

  get "signup" => "users#new"
  post "users/create" => "users#create"
  get 'users/index' => "users#index"
  get "users/:id" => "users#show"
  get "users/:id/profile" => "users#show_profile"
  get "users/:id/edit" => "users#edit"
  get "users/:id/profile_edit" => "users#profile_edit"
  post "users/:id/update" => "users#update"
  post "users/:id/profile_update" => "users#profile_update"

  get 'rooms/index' => "rooms#index"
  get "rooms/new" => "rooms#new"
  post "rooms/create" => "rooms#create"
  get "rooms/:id" => "rooms#show"
  get "rooms/:id/edit" => "rooms#edit"
  post "rooms/:id/update" => "rooms#update"
  delete "rooms/:id/destroy" => "rooms#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
