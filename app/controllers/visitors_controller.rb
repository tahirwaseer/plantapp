class VisitorsController < ApplicationController
	def index
		if current_user.admin
			redirect_to '/admin'
		end
	end
end
