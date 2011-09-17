class CreateDirectCosts < ActiveRecord::Migration
  def change
    create_table :direct_costs do |t|
      t.string      :name,                null: false
      t.decimal     :fixed_cost_price,    null: false, precision: 16, scale: 8
      t.decimal     :variable_cost_price, null: false, precision: 16, scale: 8
      t.string      :type,                null: false
      t.references  :product,             null: false

      t.timestamps null: false
    end

    add_index :direct_costs, :product_id
    add_index :direct_costs, [:product_id, :name], :unique => true
  end
end
