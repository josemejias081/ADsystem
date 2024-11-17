class Entity < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :logo, presence: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  has_many :notes, foreign_key: "entity_id"
  has_one_attached :logo
  validate :logo_validation


  def logo_validation
    if logo.attached?
      if logo.byte_size > 5.megabyte
        errors.add(:Logo, ": debe ser menor de 5MB") and return
      end
    end
  end



end
