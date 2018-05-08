# README

This application allows to crawl the product items in 2 links:
- [I'm an inline-style link](https://www.honestbee.sg/en/groceries/stores/fairprice)
- [I'm an inline-style link](https://www.fairprice.com.sg/)

The home page is at [I'm an inline-style link](https://desolate-gorge-69355.herokuapp.com), which has:

* 2 buttons to crawl data items from each sites, and save to Postgres database

* Links to go to the 2 pages, which display part of the data of each website:
- Honestbee: [I'm an inline-style link](https://desolate-gorge-69355.herokuapp.com/honestbee/list)
- FairPrice: [I'm an inline-style link](https://desolate-gorge-69355.herokuapp.com/fairprice/list)

* Links of Price Difference API: [I'm an inline-style link](https://desolate-gorge-69355.herokuapp.com/fairprice/list)
(https://desolate-gorge-69355.herokuapp.com/price_difference)

# TODO

* Improve the crawling by using fragment parsing of Selenium WebDriver package in order to crawl full database from each websites