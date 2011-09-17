class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string     :name, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
    add_index :companies, :user_id
    add_index :companies, [:user_id, :name], :unique => true
  end
end
