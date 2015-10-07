ActiveRecord::Schema.define do
  execute 'CREATE EXTENSION IF NOT EXISTS hstore'

  create_table(:dummies, :force => true) do |t|
    t.column :coordinates, :hstore
  end
end
