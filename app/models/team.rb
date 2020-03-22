class Team < ApplicationRecord
  has_many :favorite_teams
  has_many :users, through: :favorite_teams
  has_many :players
end
