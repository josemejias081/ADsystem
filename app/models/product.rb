class Product < ApplicationRecord
  has_and_belongs_to_many :notes, dependent: :destroy
  has_many :warehouse_details, dependent: :destroy
  belongs_to :category

  has_many :note_products
  accepts_nested_attributes_for :note_products, reject_if: :all_blank, allow_destroy: true
end
