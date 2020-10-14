class TeamsController < ApplicationController
  def new
    @team=Team.new 
  end
  
    def create
    @team = Teams.new(teams_params)
    if @team.save
      redirect_to root_path
    else
      render new
    end
    
    private
    
    def team_params
      params.require(:team).permit(:name,:leader_name,:phone_number,:email,:level_type,:password_digest,:image)
    end  
  end
end
