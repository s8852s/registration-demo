class SessionsController < ApplicationController
	def new
	  @user = User.new
	end

	def create
		if User.login(params[:user])
			session[:userprof] = params[:user][:email]
			redirect_to root_path, notice: "登入成功"
		else
			redirect_to sign_in_path, notice: "登入失敗"
		end
	end

	def destroy
		session[:userprof] = nil
		redirect_to root_path, notice: "已登出"
	end


	private
	def params_user
	  params.require(:user).permit(:email, :password)
	end
end
