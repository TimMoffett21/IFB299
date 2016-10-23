class EditPickup < ActiveRecord::Migration
  def change
    add_column :pickups, :delivery_datetime, :datetime;
    add_column :pickups, :delivery_type, :string;
    add_column :pickups, :request_id, :string;
    add_column :pickups, :totle_cost, :decimal;
    change_column :pickups, :number, :string;
  end
end
