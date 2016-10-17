class AddConfigurationTemplateToBlueprintObjects < ActiveRecord::Migration[5.0]
  def change
    add_reference :blueprint_objects, :configuration_template, foreign_key: true
  end
end
