Rails.application.routes.draw do
  get 'matches/edit'

  root 'static_pages#home'

  # DEVISE
  devise_for :admins, path: "admin"

  # RESOURCES
  resources :leagues do
    resources :matches, only: [:edit, :update]
    resources :players, only: [:edit, :update]
    member do
      get 'joueurs', to: 'leagues#show_players', as: 'players'
      get 'display_players'
      post 'add_players'
      get 'display_new_match'
      post 'new_match'
      get 'match_history'
      get 'leaderboard'
      get 'edit_player'
      put 'update_player'
      patch 'update_player'
      get 'edit_match'
      put 'update_match'
      patch 'update_match'
    end
  end
end
