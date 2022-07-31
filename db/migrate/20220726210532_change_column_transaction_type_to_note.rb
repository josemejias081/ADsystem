class ChangeColumnTransactionTypeToNote < ActiveRecord::Migration[7.0]
  def change
    remove_column :notes, :transaction_type, :integer, default: 0
    add_column :notes, :transaction_type, :integer, default: 0
  end
end
