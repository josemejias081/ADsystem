class WarehouseRecord < ApplicationRecord
  has_many :warehouse_details, dependent: :destroy
  has_many :products, through: :warehouse_details
  accepts_nested_attributes_for :warehouse_details, reject_if: :all_blank, allow_destroy: true
end
