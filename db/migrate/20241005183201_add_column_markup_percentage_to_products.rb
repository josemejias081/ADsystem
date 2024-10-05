class AddColumnMarkupPercentageToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :markup_percentage, :decimal, default: 30
  end
end
