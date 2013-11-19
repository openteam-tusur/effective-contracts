class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :lecturer_id
      t.integer :value_id
    end
  end
end
