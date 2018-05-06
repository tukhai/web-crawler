class BdcController < ApplicationController
	def bdcrate
	    require 'openssl'
	    require 'open-uri'
	    require 'watir'
	    require 'headless'

	    Headless.ly do
		    browser = Watir::Browser.new :chrome

			browser.goto('https://www.honestbee.sg/en/groceries/stores/fairprice')
			# browser.goto('https://www.honestbee.sg/en/groceries/stores/fairprice/departments/8243')
			# browser.link(text: 'All floorplans').click
			# browser.scroll.to :bottom

		    # doc = Nokogiri::HTML(open('https://www.honestbee.sg/en/groceries/stores/fairprice', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

		    # doc = Nokogiri::HTML(open(browser, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

		    # maximum_times_needed = max # of times you need the page to scroll down

			# maximum_times_needed.each do
			# @browser.driver.executeScript("window.scrollBy(0,200)")
			# sleep 0.15
			# end
		    
		    for i in 0..1
		    	puts "scrolling..."
			    browser.scroll.to :bottom
		    	sleep 5
			end

			while browser.element(class: "_23Yt64dDFIJICAEyYZ4-iZ").exists?  do
				puts "p"
				puts browser.element(class: "_23Yt64dDFIJICAEyYZ4-iZ").exists?
				puts "clicking load more..."
				browser.driver.execute_script("document.getElementsByClassName('_23Yt64dDFIJICAEyYZ4-iZ')[0].click();")
				sleep 5
			end

			puts "Finished load the page"

		    doc = Nokogiri::HTML(browser.html)

		    # entries = doc.css('.lagos-market-rates')
		    # rate = entries.css('table')[0].css('tr')[1].css('td')[1].text
		    # @formattedrate = rate[6..8]

		    @product = doc.css('.XaRs403S_a6U7-8Wfu_c3')

		    # @product.each_with_index do |c, index|
		    # 	puts "#{index} #{c.css('._2UCShViKs8ydkfj-XuvUhM').text} #{c.css('._23g1UkP8VGFqvGuLjUsc-H span').text}"
		    # end

		    puts @product.length

		    browser.close
		end

	    render template: 'bdc/home'
	end
end
