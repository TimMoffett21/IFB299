class CustomerController < ApplicationController

  def show
    @customer = User.find(params[:id])
    @employees = User.where(:identity => "customer")
    @pendingrequest = Pickup.where( "(pickupscondition ='Pending') or pickupscondition ='pending'")
  end


  def new
    @customer = User.new
  end
  
  def create
    @customer = User.new(user_params)
    if @customer.save
      log_in @customer
      flash[:success] = "Welcome to On The Spot Couriers"
      redirect_to @customer
    else
      render 'new'
    end
  end
  
  def aaa
  end
  
  
  private

    def user_params
      params.require(:user).permit(:name, :email,:identity, :password,
                                   :password_confirmation)
    end
    
  
end