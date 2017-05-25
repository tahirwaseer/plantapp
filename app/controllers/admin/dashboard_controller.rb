class Admin::DashboardController < ApplicationController
  before_action :authentication_user
  def index
    if !current_user.admin?
      redirect_to :root_path, :notice => "Access Denied"
    end
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
