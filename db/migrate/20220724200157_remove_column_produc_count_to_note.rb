class RemoveColumnProducCountToNote < ActiveRecord::Migration[7.0]
  def change
    remove_column :notes, :products_count, :integer
  end
end
