class ParallelController < ApplicationController
	def parallelrate
	    require 'openssl'
	    require 'open-uri'
	    # doc = Nokogiri::HTML(open('https://www.abokifx.com/', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
	    doc = Nokogiri::HTML(open('https://www.fairprice.com.sg/', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

	    # entries = doc.css('.lagos-market-rates-inner')
	    # rate = entries.css('table')[0].css('tr')[1].css('td')[1].text
	    # @formattedrate = rate[6..8]

	    @product = doc.css('.product')
	    puts @product.length

	    @product.each_with_index do |c, index|
		    item = Fairprice.find_or_initialize_by(id: index)
		    item.name = c.css('a.pdt_title').inner_html.split(" <span")[0]
		    item.price = c.css('span.pdt_C_price').text
		    item.extraInfo = c.css('span.pdt_Tweight').text
		    item.save!
		end

	    # entries = doc.css('.product').css('a.pdt_title')
	    #@name = doc.css('.product').css('a.pdt_title')

	    # doc.css('.product').css('a.pdt_title').each do |name|
	    # 	puts name.text
	    # end

	    #@price = doc.css('.product').css('div.pdt_price')

	    # render template: 'parallel/home'
	    render :json => @product.length
	end
end
