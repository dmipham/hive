class ChangeHoursColumnName < ActiveRecord::Migration
  def change
    rename_column :jobs, :hours, :estimated_hours
  end
end
