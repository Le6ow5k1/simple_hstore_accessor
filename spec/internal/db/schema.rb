ActiveRecord::Schema.define do
  create_table(:dummies, :force => true) do |t|
    t.column :properties, :hstore
    t.string :regular_attribute
  end

  create_table(:dummy_arguments, :force => true) do |t|
    t.column :properties, :hstore
  end

  create_table(:dummy_associations, :force => true) do |t|
  end
end
