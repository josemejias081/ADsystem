class AddColumnQuantityToNoteProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :note_products, :quantity, :integer, null: false, default: 0
  end
end
