Rails.application.routes.draw do
  devise_for :users
  
  root to: "test#test"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  controller :test do
    get 'test'
  end
end
