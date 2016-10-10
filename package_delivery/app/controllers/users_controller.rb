class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @loginuser = params[:id]
    @employees_available = User.where("identity = 'driver'")
    @employee_status = EmployeeWorkingStatus.all
   
    @pending_delivery = Pickup.where(:pickupscondition=>"Pickup Complete")
    @pending_pickup = Pickup.where( "(pickupscondition ='Pending') or pickupscondition ='pending'")
    
    @allpickup = Pickup.all
   
    
  end
  
 

  def new
    @user = User.new
  end
  
  
  def ConfirmEmployee
    
  end
  
  def create
    @user = User.new(user_params)
    if @user.identity == "driver"
      employeestatus = EmployeeWorkingStatus.new(employeeid: @user.id,status: "Available")
      employeestatus.save
    end

    if @user.save
      log_in @user
      flash[:success] = "Welcome to On The Spot Couriers"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def assignjob
   
    @selectedemployee = EmployeeWorkingStatus.find_by(employeeid: params[:employeeid][:eid])
    Rails.logger.debug("My object: #{@selectedemployee.id}")
    @selectedemployee.update_attributes(status:"Working")
    @selectedemployee.save
    
    @selectedrequest = Pickup.find(params[:rid])
    @selectedrequest.update_attributes(pickupscondition: "Accepted",employeeid: params[:employeeid][:eid])
    @selectedrequest.save
    
    
    
    
    
    
   
    
    @pickup =PickupHistory.new(condition:"Accepted",employeeid: params[:employeeid][:eid],pickupid: @selectedrequest.id)
    @pickup.save
    redirect_to current_user
  end
  
  
  
  private

    def user_params
      params.require(:user).permit(:name, :email,:identity, :password,
                                   :password_confirmation)
    end
    
    def employeestatus_params
      params.require(:employee_working_statuses).permit(:employeeid, :status)
    end
    
    
  
end