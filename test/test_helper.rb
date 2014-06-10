$:.unshift(File.dirname(__FILE__))
require '../lib/verizon'

require 'test/unit'
require 'dust'


SECRET_KEY = ENV['VZ_SECRET_KEY']
ACCESS_KEY = ENV['VZ_ACCESS_KEY']