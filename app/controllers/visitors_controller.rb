class VisitorsController < ApplicationController
	def index
		if current_user.admin
			redirect_to '/admin'
		else
			@plants = current_user.plants
    		@last_refresh = Time.now().strftime("%Y-%m-%d %H:%M %p")

			if params[:date].nil?
		      filter_date = Date.today.strftime("%Y-%m-%d")
		      @fdate = Date.strptime(filter_date, "%Y-%m-%d")
		    else
		      @fdate = Date.strptime(params[:date], "%Y-%m-%d")
		    end
			if params[:plants].present?
      			plants_ids = params[:plants].split(',')
      			plants_ids = params[:plants].split(',')
  				@material_requirements = @plants.where(id: plants_ids).includes(:material_requirements)
			else
				@material_requirements = @plants.includes(:material_requirements)
			end

		end

    end
end
