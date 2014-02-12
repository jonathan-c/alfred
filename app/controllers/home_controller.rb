class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end
  
  def update_weight
    current_user.statuses.last.update_attributes(weight: params[:weight])
    redirect_to root_path
  end
end
