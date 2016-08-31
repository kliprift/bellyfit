class TeamsController < ApplicationController
  before_action :set_team, only: [:show]
  def new
    @team = current_user.teams.new
  end

  def create
    @team = current_user.teams.new(team_params)
    if @team.save
      redirect_to user_team_path(current_user.id, @team.id)
    else
      render :new
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :location, :description)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
