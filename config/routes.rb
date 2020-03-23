Rails.application.routes.draw do
resources :users
resources :teams
resources :players
# resources :favorite_teams
post '/favorite_teams', to: 'teams#favorite'
                              # teams is controller % favorite is the method name
delete '/favorite_teams/:user_id/:team_id', to: 'teams#destroy'

post '/fakelogin', to: 'users#fake_create'
end
