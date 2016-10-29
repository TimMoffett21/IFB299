class TrackEmployeeUpdate < ActiveRecord::Migration
  def change
    add_column :pickups, :employeeid , :integer
    add_column :users, :status, :string
  end
end
