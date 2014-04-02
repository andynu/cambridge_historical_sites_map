#!/usr/bin/env ruby

require 'rubygems'
require 'bundler'
Bundler.require(:default)
require 'sinatra'
require 'haml'
require 'sass/plugin/rack'
require 'csv'
require 'json'
# use scss for stylesheets
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

# use coffeescript for javascript
use Rack::Coffee, root: 'public', urls: '/javascripts'

def csv_to_json(csv_file)
  locations = []
  CSV.open(csv_file).each do |row|
    id,title,addr,subtitle,desc,years,year,year_start,year_end,year_approx,year_other,loc_addr,loc_zip,loc_lat,loc_lng,loc_type = row
    unless title == 'title'
      locations << {
        title: title,
        lat: loc_lat,
        lng: loc_lng,
      }
    end
  end
  return locations.to_json
end

def google_maps_api_key
  IO.read(File.expand_path("../../google_maps_api.key",__FILE__).strip)
end

get '/' do
  data_file = File.expand_path("../public/blue_oval_markers.csv",__FILE__)
  @google_maps_api_key = google_maps_api_key
  @locations = csv_to_json(data_file)
  haml :index
end

