# README

This application allows to crawl the product items in 2 links:
- [Honestbee](https://www.honestbee.sg/en/groceries/stores/fairprice)
- [Fairprice](https://www.fairprice.com.sg/)

[The home page](https://desolate-gorge-69355.herokuapp.com) has:

* 2 buttons to crawl data items from each sites, and save to Postgres database

* Links to go to the 2 pages, which display part of the data of each website: [Honestbee](https://desolate-gorge-69355.herokuapp.com/honestbee/list), [FairPrice](https://desolate-gorge-69355.herokuapp.com/fairprice/list)

* [Links of Price Difference API](https://desolate-gorge-69355.herokuapp.com/price_difference)

# TODO

* Improve the crawling by using fragment parsing of Selenium WebDriver package in order to crawl full database from each websites: Only parse the newly rendered html part after clicking 'Load More' button and save into databas

* Fixing the crash bug on heroku production (excess memory) when clicking 'Load More' buttons many times

* Include page number for Price Difference API so it can provide item 10th to 19th, 20th to 29th, etc.