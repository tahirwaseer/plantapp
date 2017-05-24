class CreateMaterialRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :material_requirements do |t|
      t.references :plant, foreign_key: true
      t.date :order_date
      t.string :item_code
      t.string :item_description
      t.string :item_type
      t.string :item_type_description
      t.string :uom
      t.integer :demand
      t.integer :receipts
      t.integer :inv_on_hand
      t.datetime :inventory_run_out_time

      t.timestamps
    end
  end
end
