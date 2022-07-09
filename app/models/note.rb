class Note < ApplicationRecord
  has_and_belongs_to_many :products, dependent: :destroy
  has_many :notes_products, dependent: :destroy
  accepts_nested_attributes_for :notes_products, reject_if: :all_blank, allow_destroy: true
  
end
