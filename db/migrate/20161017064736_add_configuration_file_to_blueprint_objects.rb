class AddConfigurationFileToBlueprintObjects < ActiveRecord::Migration[5.0]
  def change
    add_reference :blueprint_objects, :configuration_file, foreign_key: true
  end
end
