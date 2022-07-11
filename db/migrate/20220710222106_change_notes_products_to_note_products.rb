class ChangeNotesProductsToNoteProducts < ActiveRecord::Migration[7.0]
  def change
    rename_table :notes_products, :note_products
  end
end
