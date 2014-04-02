cambridge_historical_sites_map
==============================

google maps mashup.

## Goal:

### get data

Find all the locations in [markers html](http://www2.cambridgema.gov/historic/markers.html)

ugh. it is an awkward pdf [markers pdf](http://www2.cambridgema.gov/historic/markers_text.pdf)

lets try free ocr [onlineocr](http://www.onlineocr.net/)

had to register, but totally worked!  see data/raw.txt
still inconsistencies. probably faster to do a manual pass. 
[see manual_cleaning.txt](manual_cleaning.txt)

### geocode the data

Used the [geocoder gem](http://www.rubygeocoder.com/). 

### map the data

* [google maps api](https://developers.google.com/maps/documentation/javascript/)
* [google maps api (examples)](https://developers.google.com/maps/documentation/javascript/examples)

api key generated, client\_secrets.json (gitignored)
