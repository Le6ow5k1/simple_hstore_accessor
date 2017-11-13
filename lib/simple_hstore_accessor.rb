require 'active_support'
require 'active_record'
require 'activerecord-postgres-hstore' if ::ActiveRecord::VERSION::MAJOR < 4
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
    unless serialized_attributes.key?(hstore_attribute.to_s)
      if defined?(ActiveRecord::Coders::Hstore)
        serialize hstore_attribute, ActiveRecord::Coders::Hstore
      end
    end

    accessor_keys = Array(keys).flatten.map(&:to_sym)

    accessor_keys.each do |key|
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

    define_method :write_attribute do |attr_name, value|
      if accessor_keys.include?(attr_name.to_sym)
        public_send("#{attr_name}=", value)
      else
        super(attr_name, value)
      end
    end

    define_method :read_attribute do |attr_name|
      if accessor_keys.include?(attr_name.to_sym)
        public_send(attr_name)
      else
        super(attr_name)
      end
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
