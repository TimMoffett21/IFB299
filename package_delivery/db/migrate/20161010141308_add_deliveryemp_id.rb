class AddDeliveryempId < ActiveRecord::Migration
  def change
    add_column :pickups, :deliveryemployee_id, :integer,:null => false, :default => 0
  end
end
