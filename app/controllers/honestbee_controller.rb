class HonestbeeController < ApplicationController
	def list
	    @honestbees = Honestbee.all
	    puts @honestbees
	end
end
