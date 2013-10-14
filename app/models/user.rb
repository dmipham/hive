class User < ActiveRecord::Base
  
  has_and_belongs_to_many :jobs
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :address_1, :address_2, :city, :drive, :first_name, :last_name, :phone, :rating, :school, :state, :work_type, :zip_code, :admin, :role, :work_type_moving, :work_type_cleaning, :work_type_painting, :work_type_yard, :work_type_it, :work_type_tutor, :work_type_babysit, :work_type_event, :work_type_errands, :work_type_maintenance, :job_id, :stripe, :nps, :approved
  
  def save_stripe_customer_id(customer_id)
    update_attributes(:stripe => customer_id)
  end
  
end
