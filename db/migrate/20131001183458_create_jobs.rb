class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :work_type
      t.integer :hours
      t.integer :workers
      t.datetime :date_time

      t.timestamps
    end
  end
end
