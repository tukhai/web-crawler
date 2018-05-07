class HonestbeeController < ApplicationController
	def list
	    @honestbees = Honestbee.all[0..10]
	end
end
