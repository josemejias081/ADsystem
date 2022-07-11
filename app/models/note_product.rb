class NoteProduct < ApplicationRecord
  belongs_to :note
  
  belongs_to :product
end