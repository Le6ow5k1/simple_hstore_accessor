# coding: utf-8

class Dummy < ActiveRecord::Base
  store_accessor :properties, :latitude, :longitude, :dummy_association_id

  belongs_to :dummy_association
end
