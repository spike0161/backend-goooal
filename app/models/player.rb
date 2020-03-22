class Player < ApplicationRecord
  has_many :users, through: :favorite_players
  has_many :favorite_players
  belongs_to :team
end
