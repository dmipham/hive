class RemoveUserFromJob < ActiveRecord::Migration
  def up
    remove_column :jobs, :user_id
  end

  def down
    add_column :jobs, :user_id, :integer
  end
end
