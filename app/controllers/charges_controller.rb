class ChargesController < JobsController
  
  def new
    
  end

  def create
    
     Stripe.api_key = "sk_test_1NQai375Xxj1lKFlXyYkGXJ1"
    
    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create a Customer
    customer = Stripe::Customer.create(
      :card => token,
      :email => current_user.email,
      :description => current_user.first_name + current_user.last_name
    )

    # Save the customer ID in your database so you can use it later
    current_user.save_stripe_customer_id(customer.id)
    
    redirect_to user_path(current_user), :flash => { :success => "Thank you for your payment" }   

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
  
  def pay
    
    @job = Job.find(params[:job_id])
    
    @amount = @job.pay_amount * 100
    
    # Later...
    customer_id = current_user.stripe

    Stripe::Charge.create(
      :customer => customer_id,
      :amount   => @amount,
      :description => @job.id.to_s + " " + @job.work_type + " " + @job.date_time.strftime("%D %l:%M %P"),
      :currency => "usd"
    )
    
    @job.update_attribute(:paid, true)
    
    redirect_to user_path(current_user), :flash => { :success => "Thank you for your payment" }   

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
  
end
