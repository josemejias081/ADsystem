class AddProductsCountToNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :products_count, :integer
  end
end
