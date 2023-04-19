Rails.application.routes.draw do
  root "top#index"
  devise_for :diviners
  devise_for :users
  resources :rooms, :only => [:show, :create] do
    resources :messages, :only => [:create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
