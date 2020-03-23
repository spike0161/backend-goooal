class UsersController < ApplicationController

def index
  users = User.all
  render json: users
end
  def show
    user = User.find(params[:id])
    render json: {user: user, favorites: user.teams}
  end

  def create
User.find_or_create_by(name: params[:name], username: params[:username])
  end

  def fake_create
    user = User.find_by(username: params['username'])
    render json: user
  end
end
