class ChangeColumnStockToProduct < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :stock, :integer, null: false, default: 0
  end
end
