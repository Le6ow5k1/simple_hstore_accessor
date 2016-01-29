# coding: utf-8
class DummyArgument < ActiveRecord::Base
  store_accessor :properties, [:latitude, :longitude]
end
