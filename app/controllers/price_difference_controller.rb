class PriceDifferenceController < ApplicationController
	def main
		@results = Honestbee.select(
					  [
					    Honestbee.arel_table[:name], Honestbee.arel_table[:price].as('honestbees_price'), Fairprice.arel_table[:price].as('fairprice_price')
					  ]
					).joins(
					  Honestbee.arel_table.join(Fairprice.arel_table).on(
					    Honestbee.arel_table[:name].eq(Fairprice.arel_table[:name])
					  ).join_sources
					).limit(10)

		render :json => @results
	end
end
