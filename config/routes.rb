ActionController::Routing::Routes.draw do |map|
	# la raiz
	map.root :controller => 'home', :action => 'index'
	# autenticacion / signup
	map.logout '/logout', :controller => 'sessions', :action => 'destroy'
	map.login '/login', :controller => 'sessions', :action => 'new'
	map.register '/register', :controller => 'users', :action => 'create'
	map.signup '/signup', :controller => 'users', :action => 'new'
	# restful
	map.resources :users
	map.resource :session
	# perfil
	map.connect 'user/profile/:action', :controller => 'profile'
end
