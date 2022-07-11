class CreateWarehouseRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouse_records do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
