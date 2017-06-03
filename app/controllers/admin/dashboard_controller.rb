class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
    if !current_user.admin?
      redirect_to root_path, :notice => "Access Denied"
    end
    @users = User.normal_users

    @plants = @select_region = Plant.all
    @user_plants = []
    # @current_user_plants = current_user.plants
  end

  def show
    
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def region_selection
    
  end
end
