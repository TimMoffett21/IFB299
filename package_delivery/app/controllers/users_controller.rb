class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  

  
  
  
  def show
    @user = User.find(params[:id])
    @loginuser = params[:id]
    
    @employees = User.where(:identity => "driver")
    @employees_available = User.where("identity = 'driver'")
    @pending_delivery = Pickup.where(:pickupscondition=>"Pickup Complete")
    @pending_pickup = Pickup.where( "(pickupscondition ='Pending') or pickupscondition ='pending'")
    @allpickup = Pickup.all
    @employee_status = EmployeeWorkingStatus.all
    @pendingrequest = Pickup.where( "(pickupscondition ='Pending') or pickupscondition ='pending'")
  end
  
  def show_employee
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  def ConfirmEmployee
    
  end

  # Create
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
  
  # Edit
  def edit
    @user = User.find(current_user)
  end
  # Update
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  # Delete
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
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
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(current_user)
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  
end