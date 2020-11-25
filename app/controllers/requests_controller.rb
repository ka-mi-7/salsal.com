class RequestsController < ApplicationController
  def create
    current_team.requests.create!(recruit_id: params[:recruit_id])
    #Request.create!(team_id: current_team.id, recruit_id: params[:recruit_id])
    redirect_to recruit_path(params[:recruit_id])
  end
end
