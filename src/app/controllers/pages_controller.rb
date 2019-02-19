class PagesController < ApplicationController
	def show
		@carousel_images = ["DSC04531.JPG", "DSC04620.JPG", "DSC04641.JPG", "DSC04650.JPG", "DSC04658.JPG"]
		if valid_page?
			render template: "pages/#{params[:page]}"
		else
			render file: "public/404.html", status: :not_found
		end
	end

	private
	def valid_page?
		template_exists? "pages/#{params[:page]}"
	end
end
