class AddRegionIdToPlants < ActiveRecord::Migration[5.0]
  def change
  	add_reference :plants, :region, foreign_key: true
  	remove_column :plants, :region_name
  end
end
