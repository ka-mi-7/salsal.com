class TeamsController < ApplicationController
  def new
    @team=Team.new 
  end
  
    def create
        @team=Team.new(team_params)
      if @team.save
          redirect_to root_path
      else
        render:new
      end
    end
    
    private
    
    def team_params
      params.require(:team).permit(:name,:leader_name,:phone_number,:email,:level_type,:password_digest,:image)
    end  
  end
