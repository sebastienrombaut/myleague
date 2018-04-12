Rails.application.routes.draw do

  devise_for :players
  root 'static_pages#home'
  
  resources :leagues


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
