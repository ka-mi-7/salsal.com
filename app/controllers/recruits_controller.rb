class RecruitsController < ApplicationController
  def index
    @recruits = Recruit.order(id: :desc)
  end

  def new
  end
  
  def show
    @recruit = Recruit.find(params[:id])
  end
  
  
end
