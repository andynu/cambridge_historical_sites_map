require 'rubygems'
require 'bundler'
Bundler.require(:default)
require './myapp'

run Sinatra::Application
