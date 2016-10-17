class BlueprintObject < ApplicationRecord
  belongs_to :object_type
  belongs_to :catalog_item
  belongs_to :blueprint
  belongs_to :configuration_template
  belongs_to :configuration_file
end
