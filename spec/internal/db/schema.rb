ActiveRecord::Schema.define do
  create_table(:dummies, :force => true) do |t|
    t.column :coordinates, :hstore
  end
end
