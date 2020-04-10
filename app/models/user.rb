class User < ApplicationRecord
  has_many :favorite_teams
  has_many :teams, through: :favorite_teams
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false}
end
