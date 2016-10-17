class CreateSudos < ActiveRecord::Migration[5.0]
  def change
    create_table :sudos do |t|
      t.string :name
      t.text :description
      t.text :sudo_rule

      t.timestamps
    end
  end
end
