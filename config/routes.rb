Rails.application.routes.draw do
resources :users
resources :teams
resources :players
# resources :favorite_teams
post '/favorite_teams', to: 'teams#favorite'
                              # teams is controller % favorite is the method name
resources :favorite_players
end
