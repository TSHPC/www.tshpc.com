Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get    'login'  => :new
    post   'login'  => :create
    delete 'logout' => :destroy
  end

  resources :registrations
  resources :events
  resources :users

  # For details on the DSL available within this file, 
  # see http://guides.rubyonrails.org/routing.html
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"
end
