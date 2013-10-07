$:.unshift File.expand_path("../lib", __FILE__)
#\ -p 4567
require 'sinatra'
require 'languess_web'

run LanguessWeb
