class Product < ApplicationRecord
  has_and_belongs_to_many :notes, dependent: :destroy
  
  belongs_to :category

  has_many :notes_products
  accepts_nested_attributes_for :notes_products, reject_if: :all_blank, allow_destroy: true
end
