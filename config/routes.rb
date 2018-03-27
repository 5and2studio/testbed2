Rails.application.routes.draw do
  devise_for :users
  
  root to: "test#test"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  controller :test do
    get 'test'
    get 'guarded'
    get 'quotes'
    get 'users'
  end

  namespace :api do
    resources :users
  end
end
