class UserTeamsController < ApplicationController
  before_action :set_user_team, only: [:destroy]
  def new
  	# byebug
  	@team = Team.find(params[:team_id])
  	@user_team = @team.user_teams.new
  end

  def create
  	 if User.find_by(name: params[:user_teams][:name]) != nil
  	 	@user = User.find_by(name: params[:user_teams][:name]) 
  	 	@user_team = @user.user_teams.create(team_id: params[:team_id])
  	 	
  	 	redirect_to user_team_path(current_user, params[:team_id])
  	 elsif User.find_by(email: params[:user_teams][:email]) != nil
  	 	@user = User.find_by(email: params[:user_teams][:email])
  	 	@user_team = @user.user_teams.create(team_id: params[:team_id])
  	 	
  	 	redirect_to user_team_path(current_user, params[:team_id])
  	 else
  	 	render :new
  	 end
  end

  def destroy
    @user_team.destroy
    @team = Team.find(params[:team_id])
    redirect_to user_team_path(current_user.id, @team.id)
  end

  private
  def set_user_team

    @user_team = UserTeam.find(params[:id])
  end
end
