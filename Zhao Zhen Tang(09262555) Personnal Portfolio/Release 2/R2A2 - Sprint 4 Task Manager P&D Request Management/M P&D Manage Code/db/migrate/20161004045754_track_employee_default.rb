class TrackEmployeeDefault < ActiveRecord::Migration
  def change
    change_column :pickups , :employeeid, :integer, :null => false, :default => 0
    change_column :pickups , :pickupscondition, :string,:null => false, :default => "pending"
    change_column :users , :status, :string,:null => false, :default => "Available"
  end
end
