class RenameActiveInPlantsTable < ActiveRecord::Migration[5.0]
  def change
  	rename_column :plants, :Active, :active
  end
end
