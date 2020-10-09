class HomeController < ApplicationController
  def top
    @recruits = Recruit.order(id: :desc)
  end
end
