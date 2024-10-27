class Product < ApplicationRecord
  validates :name, presence: true
  validates :photo, presence: true
  validates :description, presence: true
  validates :stock, presence: true
  validates :price, presence: true
  validates :cost, presence: true
  belongs_to :category

  has_and_belongs_to_many :notes, through: :note_products
  has_many :warehouse_details, dependent: :destroy
  
  has_many :note_products, dependent: :destroy
  accepts_nested_attributes_for :note_products, reject_if: :all_blank, allow_destroy: true

  has_one_attached :photo
  validates :photo, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validate :photo_validation

  def sale_price
    cost + (cost * (markup_percentage / 100))
  end

  def photo_validation
    if photo.attached?
      if photo.byte_size > 5.megabyte
        errors.add(:Foto, ": debe ser menor de 5MB") and return
      end
    end
  end
end
