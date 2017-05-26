class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
    if !current_user.admin?
      redirect_to root_path, :notice => "Access Denied"
    end
    @users = User.all
    @select_region = Plant.all
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
