class Blueprint < ApplicationRecord
  belongs_to :user
  has_many :blueprint_objects
  accepts_nested_attributes_for :blueprint_objects, allow_destroy: true

end
