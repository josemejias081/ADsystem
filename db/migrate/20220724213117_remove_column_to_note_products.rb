class RemoveColumnToNoteProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :note_products, :quantity, :integer
  end
end
