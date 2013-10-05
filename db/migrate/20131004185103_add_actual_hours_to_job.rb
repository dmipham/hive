class AddActualHoursToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :actual_hours, :integer
  end
end
