class Product < ApplicationRecord
  has_and_belongs_to_many :notes, dependent: :destroy
  
  belongs_to :category
end
