Rails.application.routes.draw do
  root 'static_pages#home'

  # DEVISE
  devise_for :admins, path: "admin"

  # RESOURCES
  resources :players, only: [:show]

  resources :leagues do
    member do
      get 'joueurs', to: 'leagues#show_players', as: 'players'
      get 'display_players'
      post 'add_players'
      get 'display_new_match'
      post 'new_match'
      get 'match_history'
      get 'leaderboard'
    end
  end
end
