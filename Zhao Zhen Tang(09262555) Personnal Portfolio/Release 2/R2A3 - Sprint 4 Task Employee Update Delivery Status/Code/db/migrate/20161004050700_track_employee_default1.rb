class TrackEmployeeDefault1 < ActiveRecord::Migration
  def change
    change_column :pickups , :pickupscondition, :string,:null => false, :default => "Pending"
  end
end
