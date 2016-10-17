class RenameConfigurationDetailTypes < ActiveRecord::Migration[5.0]
  def change
	rename_column :configuration_detail_types, :cofigure_format, :configure_format
  end
end
