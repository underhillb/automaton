class CreateCatalogItems < ActiveRecord::Migration[5.0]
  def change
    create_table :catalog_items do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
