Rails.application.routes.draw do
resources :users
resources :teams
resources :players
resources :favorite_teams
resources :favorite_players
end
