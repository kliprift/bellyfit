class UserTeamsController < ApplicationController
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
    byebug
  end
end
