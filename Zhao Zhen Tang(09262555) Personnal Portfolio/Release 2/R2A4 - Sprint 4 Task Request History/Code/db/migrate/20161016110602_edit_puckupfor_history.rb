class EditPuckupforHistory < ActiveRecord::Migration
  def change
    add_column :pickups, :customer_id, :integer, :default => 0
  end
end
