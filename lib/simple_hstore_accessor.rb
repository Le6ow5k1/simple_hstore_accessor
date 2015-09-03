require 'active_support'
require 'active_record'
require 'simple_hstore_accessor/version'

module SimpleHstoreAccessor
  # Public: Rails4-like method which defines simple accessors for hstore fields
  #
  # hstore_attribute - your Hstore column
  # keys - Array of fields in your hstore
  #
  # Example
  #
  #   class Person < ActiveRecord::Base
  #     store_accessor :favorites_info, :book, :color
  #   end
  #
  # Returns nothing
  def store_accessor(hstore_attribute, *keys)
    Array(keys).flatten.each do |key|
      define_method("#{key}=") do |value|
        send("#{hstore_attribute}_will_change!")
        send("#{hstore_attribute}=", (send(hstore_attribute) || {}).merge(key.to_s => value))
      end
      define_method(key) do
        send(hstore_attribute) && send(hstore_attribute)[key.to_s]
      end
      define_method("#{key}_will_change!") { attribute_will_change!(key.to_s) }
      define_method("#{key}_changed?") { attribute_changed?(key.to_s) }
    end

    define_method("#{hstore_attribute}=") do |new_properties|
      current_properties = send(hstore_attribute) || {}

      (current_properties.keys | new_properties.keys).each do |key|
        next if current_properties[key].to_s == new_properties[key].to_s || !respond_to?("#{key}_will_change!")
        send("#{key}_will_change!")
      end

      super(new_properties)
    end
  end
end

ActiveSupport.on_load(:active_record) { extend SimpleHstoreAccessor }
