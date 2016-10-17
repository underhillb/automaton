class AddConfigureFormatToConfigurationDetailTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :configuration_detail_types, :cofigure_format, :string
  end
end
