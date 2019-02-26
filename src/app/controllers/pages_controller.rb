class PagesController < ApplicationController
	def show
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
