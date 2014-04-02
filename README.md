cambridge_historical_sites_map
==============================

google maps mashup.

## Goal:

### get data

Find all the locations in [markers html](http://www2.cambridgema.gov/historic/markers.html)

ugh. it is an awkward pdf [markers pdf](http://www2.cambridgema.gov/historic/markers_text.pdf)

    raw.pdf

lets try free ocr [onlineocr](http://www.onlineocr.net/)
had to register, but totally worked!

    raw.txt

still inconsistencies. probably faster to do a manual pass. 

    raw_utf8.txt
    manual_cleaning.txt

Ok, better. bin/parse now generates a csv. Structured data from here on out.

    parsed.csv

### geocode the data

Used the [geocoder gem](http://www.rubygeocoder.com/). 

    geocoded.csv

Plus a manual pass for the crazy values.

    geocoded_cleaned.csv

and copied into

    www/public/blue_oval_markers.csv

### map the data

* [google maps api](https://developers.google.com/maps/documentation/javascript/)
* [google maps api (examples)](https://developers.google.com/maps/documentation/javascript/examples)

api key generated, google_maps_api.key (gitignored)
