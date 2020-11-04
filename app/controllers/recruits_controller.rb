class RecruitsController < ApplicationController
  def index
    @recruits = Recruit.order(id: :desc)
  end

  def new
    @recruit = Recruit.new
  end
  
  def show
    @recruits = Recruit.find(params[:id])
  end
  
  def create
    @recruit = Recruit.new(recruit_params)
    @recruit.team = current_team
    if @recruit.save
      redirect_to root_path
    else
      render:new
    end
  end
    
  private
  
  def recruit_params
    params.require(:recruit).permit(:prefecture, :address, :level_type, :start_at, :end_at, :comment)
  end  
end
