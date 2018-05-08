class HonestbeeController < ApplicationController
	def list
	    @honestbees = Honestbee.all.length
	    puts @honestbees
	end
end
