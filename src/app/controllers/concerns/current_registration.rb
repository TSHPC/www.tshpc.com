module CurrentRegistration
	private
	def set_registration
		@cart = Registration.find(session[:registration_id])
	rescue ActiveRecord::RecordNotFound
		@resgistration = resgistration.create
		session[:resgistration_id] = @resgistration.id
	end
end