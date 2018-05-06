class FairpriceController < ApplicationController
	def list
	    @fairprices = Fairprice.all
	end
end
