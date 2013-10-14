class AddPayLevelToUser < ActiveRecord::Migration
  def change
    add_column :users, :pay_level, :integer
  end
end
