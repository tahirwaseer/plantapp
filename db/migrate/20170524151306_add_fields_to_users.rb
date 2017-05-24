class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :effective_start_date, :date
    add_column :users, :effective_end_date, :date
  end
end
