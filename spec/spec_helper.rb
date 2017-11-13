# coding: utf-8
require 'simple_hstore_accessor'

require 'combustion'
Combustion.initialize! :active_record

Dir['./spec/support/shared_examples/*.rb'].each { |f| require f }
require 'pry-byebug'
