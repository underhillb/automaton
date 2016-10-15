class CreateBlueprintObjects < ActiveRecord::Migration[5.0]
  def change
    create_table :blueprint_objects do |t|
      t.references :object_type, foreign_key: true
      t.references :catalog_item, foreign_key: true
      t.references :blueprint, foreign_key: true
      t.string :name
      t.text :description
      t.integer :version

      t.timestamps
    end
  end
end
