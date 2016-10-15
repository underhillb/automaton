class BlueprintObject < ApplicationRecord
  belongs_to :object_type
  belongs_to :catalog_item
  belongs_to :blueprint
end
