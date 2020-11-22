module SessionsHelper
	def current_user
		if session[:userprof].present?
			@user ||= User.find_by(email: session[:userprof])
		else
			nil
		end
	end
end
