class CreateConfigurationFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :configuration_files do |t|
      t.references :configuration_template, foreign_key: true
      t.integer :version
      t.text :file_content

      t.timestamps
    end
  end
end
