class Job < ActiveRecord::Base
  
  belongs_to :user
  
  attr_accessible :address_1, :address_2, :city, :date_time, :hours, :state, :work_type, :workers, :zip_code, :description, :user_id
end
