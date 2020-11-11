class RecruitsController < ApplicationController
  def index
    @keyword = params[:keyword].presence || ''
    @pref = params[:pref].presence || ''
    
    @recruits = Recruit.all
    
    @recruits = @recruits.where('comment like ?',"%#{params[:keyword]}%") if @keyword.present?
    @recruits = @recruits.where(prefecture: params[:pref]) if @pref.present?
    
    @recruits = @recruits.order(id: :desc)
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
