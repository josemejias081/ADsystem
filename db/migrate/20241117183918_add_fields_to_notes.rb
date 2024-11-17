class AddFieldsToNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :unit_price, :decimal 
    add_column :notes, :iva_percentage, :decimal, default: 21.0 
    add_column :notes, :subtotal, :decimal 
    add_column :notes, :iva_amount, :decimal 
    add_column :notes, :total, :decimal
  end
end
