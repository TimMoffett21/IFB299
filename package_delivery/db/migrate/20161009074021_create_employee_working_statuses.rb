class CreateEmployeeWorkingStatuses < ActiveRecord::Migration
  def change
    create_table :employee_working_statuses do |t|
      t.integer :employeeid
      t.string :status

      t.timestamps null: false
    end
  end
end
