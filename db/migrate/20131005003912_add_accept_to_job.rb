class AddAcceptToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :accepted, :boolean, :default => false
  end
end
