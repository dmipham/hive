class Job < ActiveRecord::Base
  
  has_many :users
  
  attr_accessible :address_1, :address_2, :city, :date_time, :estimated_hours, :state, :work_type, :workers, :zip_code, :description, :user_id, :actual_hours, :pay_amount, :paid, :rating, :accepted
end
