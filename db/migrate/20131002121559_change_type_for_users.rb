class ChangeTypeForUsers < ActiveRecord::Migration
  def change
    change_column :users, :work_type_moving, :boolean
    change_column :users, :work_type_cleaning, :boolean
    change_column :users, :work_type_painting, :boolean
    change_column :users, :work_type_yard, :boolean
    change_column :users, :work_type_it, :boolean
    change_column :users, :work_type_tutor, :boolean
    change_column :users, :work_type_babysit, :boolean
    change_column :users, :work_type_event, :boolean
    change_column :users, :work_type_errands, :boolean
    change_column :users, :work_type_maintenance, :boolean
  end
end
