#!/usr/bin/env ruby

require 'rubygems'
require 'bundler'
Bundler.require(:default)
require 'sinatra'
require 'haml'
require 'sass/plugin/rack'
# use scss for stylesheets
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

# use coffeescript for javascript
use Rack::Coffee, root: 'public', urls: '/javascripts'

get '/' do
  haml :index
end

