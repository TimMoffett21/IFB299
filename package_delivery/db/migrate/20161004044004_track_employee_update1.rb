class TrackEmployeeUpdate1 < ActiveRecord::Migration
  def change
    add_column :pickups, :pickupscondition , :string
  end
end
