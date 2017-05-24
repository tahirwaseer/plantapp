class CreatePlants < ActiveRecord::Migration[5.0]
  def change
    create_table :plants do |t|
      t.string :region_name
      t.string :plant_name

      t.timestamps
    end
  end
end
