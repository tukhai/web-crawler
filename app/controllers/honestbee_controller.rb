class HonestbeeController < ApplicationController
	def list
	    @honestbees = Honestbee.all
	end
end
