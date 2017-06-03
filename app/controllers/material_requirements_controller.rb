class MaterialRequirementsController < ApplicationController
  before_action :set_material_requirement, only: [:show, :edit, :update, :destroy]

  # GET /material_requirements
  # GET /material_requirements.json
  def index
    if params[:plant].present?
      @plants = Plant.where(id: params[:plant]).includes(:material_requirements)
    else
      @plants = Plant.includes(:material_requirements)
    end
  end

  # GET /material_requirements/1
  # GET /material_requirements/1.json
  def show
  end

  # GET /material_requirements/new
  def new
    @material_requirement = MaterialRequirement.new
  end

  # GET /material_requirements/1/edit
  def edit
  end

  # POST /material_requirements
  # POST /material_requirements.json
  def create
    @material_requirement = MaterialRequirement.new(material_requirement_params)

    respond_to do |format|
      if @material_requirement.save
        format.html { redirect_to material_requirements_url, notice: 'Material requirement was successfully created.' }
        format.json { render :show, status: :created, location: @material_requirement }
      else
        format.html { render :new }
        format.json { render json: @material_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_requirements/1
  # PATCH/PUT /material_requirements/1.json
  def update
    respond_to do |format|
      if @material_requirement.update(material_requirement_params)
        format.html { redirect_to material_requirements_url, notice: 'Material requirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @material_requirement }
      else
        format.html { render :edit }
        format.json { render json: @material_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_requirements/1
  # DELETE /material_requirements/1.json
  def destroy
    @material_requirement.destroy
    respond_to do |format|
      format.html { redirect_to material_requirements_url, notice: 'Material requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_requirement
      @material_requirement = MaterialRequirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_requirement_params
      params.require(:material_requirement).permit(:plant_id, :order_date, :item_code, :item_description, :item_type, :item_type_description, :uom, :demand, :receipts, :inv_on_hand, :inventory_run_out_time)
    end
end
