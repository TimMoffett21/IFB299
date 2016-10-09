class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @employees = User.where(:identity => "driver")
    @pendingrequest = Pickup.where( "(pickupscondition ='Pending') or pickupscondition ='pending'")
  end
  
  def show_employee
   
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to On The Spot Couriers"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  
  private

    def user_params
      params.require(:user).permit(:name, :email,:identity, :password,
                                   :password_confirmation)
    end
    
  
end