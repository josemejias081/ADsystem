class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :role, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
