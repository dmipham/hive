class AddWorkToUser < ActiveRecord::Migration
  def change
    add_column :users, :work_type_moving, :string
    add_column :users, :work_type_cleaning, :string
    add_column :users, :work_type_painting, :string
    add_column :users, :work_type_yard, :string
    add_column :users, :work_type_it, :string
    add_column :users, :work_type_tutor, :string
    add_column :users, :work_type_babysit, :string
    add_column :users, :work_type_event, :string
    add_column :users, :work_type_errands, :string
    add_column :users, :work_type_maintenance, :string
  end
end
