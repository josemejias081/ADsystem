class Entity < ApplicationRecord
  has_many :notes, foreign_key: "entity_id"
end
