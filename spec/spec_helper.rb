require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'dolphin'

Dir[File.expand_path('../support/*.rb', __FILE__)].each {|f| require f }