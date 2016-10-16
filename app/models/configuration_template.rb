class ConfigurationTemplate < ApplicationRecord
  has_many :configuration_details
  accepts_nested_attributes_for :configuration_details, allow_destroy: true

end
