class UsersController < ApplicationController
	layout 'timeless'
	include AuthenticatedSystem
	def new
		# el titulo
		@page_title = 'Registro de usuarios'
		@user = User.new
	end
	def create
		logout_keeping_session!
		@user = User.new(params[:user])
		success = @user && @user.save
		if success && @user.errors.empty?
			reset_session
			self.current_user = @user # !! now logged in
			redirect_back_or_default('/')
			flash[:notice] = 'Registro completo.'
		else
			flash[:error]  = 'Ocurri&oacute;n un error'
			render :action => 'new'
		end
	end
end
