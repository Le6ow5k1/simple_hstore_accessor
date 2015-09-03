# SimpleHstoreAccessor

[![Dolly](http://dolly.railsc.ru/badges/abak-press/simple_hstore_accessor/master)](http://dolly.railsc.ru/projects/125/builds/latest/?ref=master)

Simple Hstore Accessor allows you to treat fields on an hstore column as though they were actual columns in Rails 3.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "simple_hstore_accessor"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_hstore_accessor

## Setup

The `store_accessor` method accepts the name of the hstore column you'd
like to use and an array representing fields to be stored in that column.

```ruby
class Product < ActiveRecord::Base
  store_accessor :options, :color, :price
end
```

## Contributing
1. [Fork it](https://github.com/abak-press/simple_hstore_accessor/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write code _and_ tests
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
