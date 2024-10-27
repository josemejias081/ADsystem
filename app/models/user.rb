class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :role, presence: true
  #validates :photo, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  validates :photo, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validate :photo_validation

  def photo_validation
    if photo.attached?
      if photo.byte_size > 5.megabyte
        errors.add(:Foto, ": debe ser menor de 5MB") and return
      end
    end
  end

  #Definir roles
  #Mostrar roles en el form
  enum role: [:Empleado, :Administrador, :Superadmin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :Empleado
  end

  def has_role role
    self.role.name == role
  end

end
