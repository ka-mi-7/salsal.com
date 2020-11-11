class RecruitsController < ApplicationController
  def index
    @recruits = if params[:keyword]
                  Recruit.where('comment like ?',"%#{params[:keyword]}%").order(id:desc)
                else
                  Recruit.order(id: :desc)
                end
  end

  def new
    @recruits = Recruit.new
  end
  
  def show
    @recruit = Recruit.find(params[:id])
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
