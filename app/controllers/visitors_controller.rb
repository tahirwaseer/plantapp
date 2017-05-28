class VisitorsController < ApplicationController
	def index
		if current_user.admin
			redirect_to '/admin'
		else
			@plants = current_user.plants
			@plant_with_material = current_user.plants.includes(:material_requirements)
		end

	end
end
