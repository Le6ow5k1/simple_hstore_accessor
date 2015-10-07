# coding: utf-8

class Dummy < ActiveRecord::Base
  store_accessor :coordinates, :latitude, :longitude
end
