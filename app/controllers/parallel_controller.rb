class ParallelController < ApplicationController
	def parallelrate
		require 'openssl'
		require 'open-uri'
		# doc = Nokogiri::HTML(open('https://www.abokifx.com/', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
		doc = Nokogiri::HTML(open('https://www.fairprice.com.sg/', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

		@product = doc.css('.product')
		puts @product.length

		@product.each_with_index do |c, index|
			item = Fairprice.find_or_initialize_by(id: index)
			item.name = c.css('a.pdt_title').inner_html.split(" <span")[0]
			item.price = c.css('span.pdt_C_price').text
			item.extraInfo = c.css('span.pdt_Tweight').text
			item.save!
		end

		render :json => @product.length
	end
end
