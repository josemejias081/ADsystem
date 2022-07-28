class AddEntityToNotess < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :entity, null: true, foreign_key: true
  end
end
