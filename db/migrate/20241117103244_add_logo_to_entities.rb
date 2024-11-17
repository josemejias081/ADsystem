class AddLogoToEntities < ActiveRecord::Migration[7.0]
  def change
    add_column :entities, :logo, :string
  end
end
