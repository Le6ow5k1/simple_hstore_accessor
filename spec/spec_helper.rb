# coding: utf-8
require 'simple_hstore_accessor'
require 'activerecord-postgres-hstore' if ::ActiveRecord::VERSION::MAJOR < 4

require 'combustion'
Combustion.initialize! :active_record
