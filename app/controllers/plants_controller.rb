class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /plants
  # GET /plants.json
  def index
    @plants = Plant.all
  end

  # GET /plants/1
  # GET /plants/1.json
  def show
  end

  # GET /plants/new
  def new
    @plant = Plant.new
  end

  # GET /plants/1/edit
  def edit
  end

  # POST /plants
  # POST /plants.json
  def create
    @plant = Plant.new(plant_params)

    respond_to do |format|
      if @plant.save
        format.html { redirect_to plants_url, notice: 'Plant was successfully created.' }
        format.json { render :show, status: :created, location: @plant }
      else
        format.html { render :new }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plants/1
  # PATCH/PUT /plants/1.json
  def update
    respond_to do |format|
      if @plant.update(plant_params)
        format.html { redirect_to plants_url, notice: 'Plant was successfully updated.' }
        format.json { render :show, status: :ok, location: @plant }
      else
        format.html { render :edit }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plants/1
  # DELETE /plants/1.json
  def destroy
    @plant.destroy
    respond_to do |format|
      format.html { redirect_to plants_url, notice: 'Plant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def region_plants
    user = User.find(params[:user]) unless params[:user].nil?
    if params[:user].blank?
      if params[:region]  == "Select Region"
        @plants= Plant.all      
      else
        @plants = Plant.where(region_id: params[:region])
      end
    elsif params[:region]  == "Select Region" and params[:user].present?
      plant_ids = user.plant_ids
      @plants = Plant.where.not(id: plant_ids)
    else
      plant_ids = user.plant_ids
      @plants = Plant.where(region_id: params[:region]).where.not(id: plant_ids)
    end
    @user_plants = user.plants rescue []
  end


  def assign_plants
    @user = User.find(params[:user])
    if params[:plants].kind_of?(Array)
      @user.plants << Plant.find(params[:plants])
    else 
      !@user.plant_ids.include?(params[:plants].to_i)
      @user.plants << Plant.find(params[:plants])
    end
    
    @user_plants = @user.plants
    if params[:region].blank?
      @plants = Plant.where.not(id: @user.plants.ids)
    else
      @plants = Plant.where(region_id: params[:region]).where.not(id: @user.plants.ids)
    end
  end

  def remove_plants
    @user = User.find(params[:user])
    if params[:plants].kind_of?(Array)
      rm_ids = @user.plants.where(id: params[:plants])
      @user.plants.delete(rm_ids)
    elsif !params[:plants]
      rm_ids = @user.plants
      @user.plants.delete(rm_ids)
    else
      @user.plant_ids.include?(params[:plants].to_i)
      @user.plants.delete(Plant.find(params[:plants]))
    end
    
    @user_plants = @user.plants
    if params[:region].blank?
      @plants = Plant.where.not(id: @user.plants.ids)
    else
      @plants = Plant.where(region_id: params[:region]).where.not(id: @user.plants.ids)
    end
  end

  def user_plants
    if params[:user].blank?
      if params[:region] == "Select Region"
        @plants = Plant.all
        @user_plants = []
      else
        @plants = Plant.where(region_id: params[:region])
        @user_plants = []
      end
    else
      @user = User.find(params[:user])
      @user_plants = @user.plants  
      @plants = Plant.where.not(id: @user.plants.ids)
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plant
      @plant = Plant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plant_params
      params.require(:plant).permit(:region_id, :plant_code, :plant_name, :Active)
    end
    def check_admin
      unless current_user.admin?
        redirect_to '/', :alert => "Access denied."
      end
    end
end
