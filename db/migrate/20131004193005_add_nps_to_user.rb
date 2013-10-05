class AddNpsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nps, :integer
  end
end
