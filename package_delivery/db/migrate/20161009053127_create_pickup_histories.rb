class CreatePickupHistories < ActiveRecord::Migration
  def change
    create_table :pickup_histories do |t|
      t.string :condition
      t.integer :pickupid
      t.integer :employeeid

      t.timestamps null: false
    end
  end
end
