class RecruitsController < ApplicationController
  def index
    @keyword = params[:kerword].presence||''
    @pref = params[:pref].presence||'' 
    @date = params[:date].presence||'' 
   
    @recruit = Recruit.all
    
    @recruits = recruits.where('commit like?',"%#{params[:kerword]}%") if kerword.present?
    @recruits = recruits.where(prefecture:params[:pref]) if @pref.present?
    @recruits = recuruts.where(start_at:@date.to_date.beggining_of_day..@date.to_date.end_of_day)if @date.present?
    
    @recruits = @recuruits.order(id:desc) 
  end

  def new
    @recruits = Recruit.new
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
