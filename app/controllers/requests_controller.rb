class RequestsController < ApplicationController
  def create
    current_team.requests.create!(recruit_id: params[:recruit_id])
    #Request.create!(team_id: current_team.id, recruit_id: params[:recruit_id])
    redirect_to recruit_path(params[:recruit_id])
  end
  
  def approve
    recruit = Recruit.find(params[:recruit_id])
    request = recruit.requests.find(params[:id])
    request.approval!
    redirect_to recruit_path(params[:recruit_id])
  end
  
  def disapprove
    request = Recruit.find(params[:recruit_id]).requests.find(params[:id])
    request.disapproval!
    redirect_to recruit_path(params[:recruit_id])
  end
end
