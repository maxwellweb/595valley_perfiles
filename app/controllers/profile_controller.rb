class ProfileController < ApplicationController
	layout 'timeless'
	before_filter :login_required
	def edit
		@profile = current_user.profile
		@page_title = 'Editar mi perfil'
		if request.post?
			success = @profile && @profile.save
			if success && @profile.errors.empty?
				flash[:notice] = 'Datos actualizados'
			else
				flash[:error] = 'Ha ocurrido un error'
			end
			redirect_to :controller => 'profile', :action => 'edit'
		end
	end
end
