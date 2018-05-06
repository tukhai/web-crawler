class ParallelController < ApplicationController
	def parallelrate
	    require 'openssl'
	    require 'open-uri'
	    # doc = Nokogiri::HTML(open('https://www.abokifx.com/', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
	    doc = Nokogiri::HTML(open('https://www.fairprice.com.sg/', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

	    # entries = doc.css('.lagos-market-rates-inner')
	    # rate = entries.css('table')[0].css('tr')[1].css('td')[1].text
	    # @formattedrate = rate[6..8]

	    # doc.css('.product').each do |item|
	    # 	puts item.content 
	    # end

	    @product = doc.css('.product')
	    puts @product.length

	    # entries = doc.css('.product').css('a.pdt_title')
	    @name = doc.css('.product').css('a.pdt_title')

	    # doc.css('.product').css('a.pdt_title').each do |name|
	    # 	puts name.text
	    # end

	    @price = doc.css('.product').css('div.pdt_price')

	    render template: 'parallel/home'
	end
end
