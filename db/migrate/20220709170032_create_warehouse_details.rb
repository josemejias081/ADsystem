class CreateWarehouseDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouse_details do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.references :warehouse_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
