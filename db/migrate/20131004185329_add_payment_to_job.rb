class AddPaymentToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :pay_amount, :integer
    add_column :jobs, :paid, :boolean, :default => false
  end
end
