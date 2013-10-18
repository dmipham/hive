class AddMinutesToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :actual_minutes, :integer
  end
end
