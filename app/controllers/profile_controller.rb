class ProfileController < ApplicationController
	layout 'timeless'
	before_filter :login_required
	def edit
		@page_title = 'Editar mi perfil'
	end
end
