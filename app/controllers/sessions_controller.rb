class SessionsController < ApplicationController

  def new
  end

  def create
    team = Team.find_by(email: params[:session][:email])
    if team && team.authenticate(params[:session][:password])
      log_in team
      redirect_to root_path
    else
      flash[:danger] = 'emailまたはpasswordが誤っています'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end