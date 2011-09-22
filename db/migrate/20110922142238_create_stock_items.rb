class CreateStockItems < ActiveRecord::Migration
  def change
    create_table :stock_items do |t|
      t.references :company,            null: false
      t.string     :name,               null: false
      t.decimal    :minimum_usage,      null: false, precision: 16, scale: 8, default: 0
      t.decimal    :maximum_usage,      null: false, precision: 16, scale: 8
      t.decimal    :minimum_lead_time,  null: false, precision: 16, scale: 8
      t.decimal    :maximum_lead_time,  null: false, precision: 16, scale: 8
      t.decimal    :order_cost,         null: false, precision: 16, scale: 8
      t.decimal    :buffer,             null: false, precision: 16, scale: 8, default: 0
      t.decimal    :holding_cost,       null: false, precision: 16, scale: 8

      t.timestamps null: false
    end
    add_index :stock_items, :company_id
    add_index :stock_items, [:company_id, :name], :unique => true
  end
end