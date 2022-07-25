class NoteProduct < ApplicationRecord
  belongs_to :note
  belongs_to :product
  counter_culture :product, column_name: 'stock', delta_column: 'quantity'

end
