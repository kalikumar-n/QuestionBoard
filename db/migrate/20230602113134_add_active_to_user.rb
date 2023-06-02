class AddActiveToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :active, :boolean
    add_column :users, :status_updated_at, :timestamp
  end
end
