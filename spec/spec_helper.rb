require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'dolphin'
