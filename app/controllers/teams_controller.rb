class TeamsController < ApplicationController


  def index
    teams = Team.all
    render json: teams.to_json(
      {:except => [:created_at, :updated_at]})
  end

  def show
    team = Team.find(params[:id])
    render json: team.to_json()
  end

  def favorite_team
  favorite_team = FavoriteTeam.find_or_create_by(user_id: params[:user_id], team_id: params[:team_id])
  render json: favorite_team
  end

end
