class CreateBlueprints < ActiveRecord::Migration[5.0]
  def change
    create_table :blueprints do |t|
      t.string :name
      t.text :description
      t.integer :version
      t.references :user, foreign_key: true
      t.string :group

      t.timestamps
    end
  end
end
