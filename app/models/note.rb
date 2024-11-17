class Note < ApplicationRecord
  validates :name, presence: true
  validates :transaction_type, presence: true
  validates :unit_price, :quantity, :iva_percentage, presence: true

  belongs_to :entity, :optional => true
  has_many :note_products, dependent: :destroy
  has_many :products, through: :note_products
  accepts_nested_attributes_for :note_products, reject_if: :all_blank, allow_destroy: true

  enum transaction_type: [:Compra, :Venta]
  after_initialize :set_default_transaction_type, :if => :new_record?

  before_validation :calculate_totals 
  def calculate_totals 
    self.subtotal = product.price * quantity 
    self.iva_amount = subtotal * (iva_percentage / 100.0) 
    self.total = subtotal + iva_amount 
  end 
  

  def set_default_transaction_type
    self.transaction_type ||= :Compra
  end

  def has_transaction_type transaction_type
    self.transaction_type.name == transaction_type
  end
end
