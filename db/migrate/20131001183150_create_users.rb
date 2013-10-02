class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :school
      t.string :work_type
      t.string :phone
      t.boolean :drive
      t.string :rating

      t.timestamps
    end
  end
end
