Rails.application.routes.draw do
  resources :carts
  get 'admin/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  # For details on the DSL available within this file, 
  # see http://guides.rubyonrails.org/routing.html
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"
end
