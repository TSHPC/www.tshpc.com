module SessionsHelper
	def current_user?
		return session[:user_id] != nil
	end

	def current_user
		return User.find_by(id: session[:user_id])
	end
end
