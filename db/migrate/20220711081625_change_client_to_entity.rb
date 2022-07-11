class ChangeClientToEntity < ActiveRecord::Migration[7.0]
  def change
    rename_table :clients, :entities
    add_column :entities, :client, :boolean
    add_column :entities, :supplier, :boolean
  end
end
