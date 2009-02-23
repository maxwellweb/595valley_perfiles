module ApplicationHelper
	def onload_focus(ctrl)
		# pequeno helper de js
		# para dar foco a un control
		html = "<script type=\"text/javascript\">document.getElementById('#{ctrl}').focus();</script>"
		return html
	end
end
