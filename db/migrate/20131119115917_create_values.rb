class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.integer :factor_id
      t.string :name
    end
  end
end
