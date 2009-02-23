class ApplicationController < ActionController::Base
	include AuthenticatedSystem
	helper :all
	protect_from_forgery :secret => '7316a1a6c3d2196b94711539e561baf6'
end
