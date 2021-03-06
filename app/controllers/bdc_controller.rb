class BdcController < ApplicationController
	def bdcrate
		require 'openssl'
		require 'open-uri'
		require 'watir'
		require 'headless'

		options = Selenium::WebDriver::Chrome::Options.new
		chrome_bin_path = ENV.fetch('GOOGLE_CHROME_SHIM', nil)
		options.binary = chrome_bin_path if chrome_bin_path # only use custom path on heroku
		options.add_argument('--headless') # this may be optional
		driver = Selenium::WebDriver.for :chrome, options: options
		browser = driver.navigate.to "https://www.honestbee.sg/en/groceries/stores/fairprice"

		for i in 0..1
			puts "scrolling..."
			driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")
			sleep 5
		end

		for i in 0..5
			puts "#{i} clicking load more..."
			begin
				driver.execute_script("document.getElementsByClassName('_23Yt64dDFIJICAEyYZ4-iZ')[0].click();")
			rescue Net::ReadTimeout => error
				nil
			end
			sleep 5
		end

		puts "Finished load the page"

		@product = driver.find_elements(:class, 'XaRs403S_a6U7-8Wfu_c3')

		puts @product.length

		@product.each_with_index do |c, index|
			item = Honestbee.find_or_initialize_by(id: index)
			item.name = c.find_element(:class, '_2UCShViKs8ydkfj-XuvUhM').text
			item.price = c.find_element(:class, '_23g1UkP8VGFqvGuLjUsc-H').text
			item.extraInfo = c.find_element(:class, '_3MvGCVMGqgv4KoGQ2wGzfk').text

			item.save!
		end

		driver.close

		render :json => @product.length
	end
end
