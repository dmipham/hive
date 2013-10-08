class AddWorkToUser < ActiveRecord::Migration
  def change
    add_column :users, :work_type_moving, :boolean
    add_column :users, :work_type_cleaning, :boolean
    add_column :users, :work_type_painting, :boolean
    add_column :users, :work_type_yard, :boolean
    add_column :users, :work_type_it, :boolean
    add_column :users, :work_type_tutor, :boolean
    add_column :users, :work_type_babysit, :boolean
    add_column :users, :work_type_event, :boolean
    add_column :users, :work_type_errands, :boolean
    add_column :users, :work_type_maintenance, :boolean
  end
end
