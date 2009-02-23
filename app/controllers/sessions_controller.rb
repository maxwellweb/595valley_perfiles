class SessionsController < ApplicationController
	include AuthenticatedSystem
	layout 'timeless'
	def new
		@page_title = 'Inicio de sesi&oacute;n'
	end
	def create
		logout_keeping_session!
		user = User.authenticate(params[:login], params[:password])
		if user
			reset_session
			self.current_user = user
			new_cookie_flag = (params[:remember_me] == "1")
			handle_remember_cookie! new_cookie_flag
			redirect_back_or_default('/')
			flash[:notice] = "Acceso satisfactorio."
		else
			note_failed_signin
			@login = params[:login]
			@remember_me = params[:remember_me]
			render :action => 'new'
		end
	end
	def destroy
		logout_killing_session!
		flash[:notice] = "Has cerrado tu sesi&oacute;n."
		redirect_back_or_default('/')
	end
	protected
	def note_failed_signin
		flash[:error] = "Datos invalidos"
		logger.warn "Login incorrecto '#{params[:login]}' desde #{request.remote_ip}. #{Time.now.utc}"
	end
end
