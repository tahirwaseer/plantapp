class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_action :check_admin
  def index
    if !current_user.admin?
      redirect_to root_path, :notice => "Access Denied"
    end
    @users = User.normal_users.active

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

  def check_admin
      unless current_user.admin?
        redirect_to '/', :alert => "Access denied."
      end
  end
end
