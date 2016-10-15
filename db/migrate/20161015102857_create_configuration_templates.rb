class CreateConfigurationTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :configuration_templates do |t|
      t.string :name
      t.text :description
      t.references :blueprint_objects, foreign_key: true

      t.timestamps
    end
  end
end
