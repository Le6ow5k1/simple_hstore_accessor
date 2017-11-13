class DummyJson < ActiveRecord::Base
  serialize :properties, JSON if Rails::VERSION::MAJOR < 4
  store_accessor :properties, :latitude, :longitude, :dummy_json_association_id

  belongs_to :dummy_json_association
end
