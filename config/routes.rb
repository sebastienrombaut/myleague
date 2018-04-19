Rails.application.routes.draw do

  get 'players/show'

  devise_for :players

  root 'static_pages#home'

  resources :players, only: [:show]
  
  resources :leagues do
    get 'show_players', on: :member
    get 'display_players', on: :member
    post 'add_players', on: :member
    get 'display_new_match', on: :member
    post 'new_match', on: :member
    get 'match_history', on: :member
    get 'leaderboard', on: :member
  end	

end
