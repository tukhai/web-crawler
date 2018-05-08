class ApplicationController < ActionController::Base
	def homepage
		render template: 'parallel/home'
	end
end
