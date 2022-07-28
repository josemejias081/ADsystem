class ChangeColumnTransactionTypeToNote < ActiveRecord::Migration[7.0]
  def change
    change_column :notes, :transaction_type, :integer, default: 0
  end
end
