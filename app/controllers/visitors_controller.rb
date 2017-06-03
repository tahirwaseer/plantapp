class VisitorsController < ApplicationController
	def index
		if current_user.admin
			redirect_to '/admin'
		else
			@plants = current_user.plants


			if params[:plant].present?
				  @material_requirements = @plants.where(:id => params[:plant]).includes(:material_requirements)
			else
				@material_requirements = @plants.includes(:material_requirements)
			end

		end

	end
end
