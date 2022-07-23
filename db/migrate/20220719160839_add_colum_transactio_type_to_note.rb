class AddColumTransactioTypeToNote < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :transaction_type, :boolean
  end
end
