class Create < ActiveRecord::Migration[7.0]
  def change
    create_table :note_products do |t|
      t.integer :quantity
      t.references :product, foreign_key: true
      t.references :note, foreign_key: true

      t.timestamps
    end
  end
end

