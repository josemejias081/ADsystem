class Note < ApplicationRecord
  #has_and_belongs_to_many :products, dependent: :destroy
  has_many :note_products, dependent: :destroy
  has_many :products, through: :note_products
  accepts_nested_attributes_for :note_products, reject_if: :all_blank, allow_destroy: true
end
