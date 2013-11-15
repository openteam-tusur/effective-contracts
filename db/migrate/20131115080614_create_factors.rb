class CreateFactors < ActiveRecord::Migration
  def change
    create_table :factors do |t|
      t.string :slug
      t.string :title
      t.string :abbr
      t.integer :grade
    end
  end
end
