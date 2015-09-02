# coding: utf-8
class Dummy < ActiveRecord::Base
  serialize :coordinates, ActiveRecord::Coders::Hstore if ::ActiveRecord::VERSION::MAJOR < 4
  store_accessor :coordinates, :latitude, :longitude
end
