class CreateJoinTableUserPlant < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :plants do |t|
      t.index [:user_id, :plant_id]
      t.index [:plant_id, :user_id]
    end
  end
end
