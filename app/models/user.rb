class User < ApplicationRecord
  has_many :favorite_teams
  has_many :teams, through: :favorite_teams
end
