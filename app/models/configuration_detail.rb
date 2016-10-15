class ConfigurationDetail < ApplicationRecord
  belongs_to :configuration_template
  belongs_to :configuration_detail_type
end
