class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@recruit)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to recruit_path(params[:recruit_id])
    else 
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to recruit_path(params[:recruit_id])
    end
  end
  
  
  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to recruit_path(params[:recruit_id])
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to recruit_path(params[:recruit_id])    
    end
  end 
  
  private
  def
    @recruit = Recruit.find([params[:relationship][:follow_id])
  end
end
