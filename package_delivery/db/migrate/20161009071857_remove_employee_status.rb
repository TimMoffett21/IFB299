class RemoveEmployeeStatus < ActiveRecord::Migration
  def change
    drop_table :employee_status
  end
end
