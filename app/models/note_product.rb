class NoteProduct < ApplicationRecord
  belongs_to :note
  belongs_to :product
  counter_culture :product, column_name: 'stock', delta_column: 'quantity'

  before_save  :set_quantity, if:[:sale_note?]
  
  private
    def set_quantity
      self.quantity  *= -1 if self.quantity.positive?
    end 

    def sale_note?
      self.note.transaction_type == "sale_note"
    end
end
