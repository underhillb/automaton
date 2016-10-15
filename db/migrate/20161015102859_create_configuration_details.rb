class CreateConfigurationDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :configuration_details do |t|
      t.references :configuration_template, foreign_key: true
      t.references :configuration_detail_type, foreign_key: true
      t.integer :configuration_detail_order
      t.text :configuration_detail_data

      t.timestamps
    end
  end
end
