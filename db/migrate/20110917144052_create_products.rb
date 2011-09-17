class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string     :name,           null: false
      t.decimal    :net_sale_price, null: false, precision: 16, scale: 8
      t.references :company,        null: false

      t.timestamps
    end

    add_index :products, :company_id
  end
end
