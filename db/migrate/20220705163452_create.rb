class Create < ActiveRecord::Migration[7.0]
  def change
    create_table :notes_products do |t|
      t.integer :quantity
      t.references :product, null: true, foreign_key: true
      t.references :note, null: true, foreign_key: true

      t.timestamps
    end
  end
end

