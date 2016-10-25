class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  

  
  
  def show
    @user = User.find(params[:id])
    @loginuser = params[:id]
    
    @employees = User.where(:identity => "driver")
    @employees_available = User.where("identity = 'driver'").order('id')
    @pending_delivery = Pickup.where(:pickupscondition=>"Pickup Complete")
    @pending_pickup = Pickup.where( "employeeid =0 or deliveryemployee_id =0").order('id')
    @allpickup = Pickup.all
    @employee_status = EmployeeWorkingStatus.all
    
    @pendingrequest = Pickup.where( "employeeid =0 or deliveryemployee_id =0")
  
    @customerpickup = Pickup.where("customer_id =?", @user.id.to_i)
    @customerpickuphistory = PickupHistory.all
    @allcustomer = User.where(:identity => "customer")
    
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
    @identity = "other"
    @user = User.new(user_params)
    begin
      @identity = current_user.identity.to_s
    rescue Exception
    end
  
    if @user.save
        if @identity =="other"
          flash[:success] = "Registration Successful. Please login to websites."
          redirect_to login_path
        else
          flash[:success] = "New employee registertion successful. View new Employee at Manage Users"
          redirect_to current_user
        end
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

  

  def assignpickup
    
    if params[:totle_cost] ==""
      flash[:danger] = "Please enter price before make assign request."
    else
        @selectedrequest = Pickup.find(params[:rid])
        @selectedrequest.update_attributes(pickupscondition: "Accepted",employeeid: params[:pickupemployeeid][:eid], totle_cost: params[:totle_cost].to_f)
        @selectedrequest.save
    
        @pickup =PickupHistory.new(condition:"Accepted",employeeid: params[:pickupemployeeid][:eid],pickupid: @selectedrequest.id)
        @pickup.save
    
    end
    redirect_to current_user
  end
  
  def assigndelivery
    s
    if params[:totle_cost] ==""
      flash[:danger] = "Please enter price before make assign request."
    else
      @selectedrequest = Pickup.find(params[:rid])
      @selectedrequest.update_attributes(deliveryemployee_id: params[:deliveryemployeeid][:deid])
      @selectedrequest.save
    end
    redirect_to current_user
  end
  
  def updatepickupstatusnext
    
    @request = Pickup.find(params[:selectedrequest])
    if @request.pickupscondition == "Accepted"
      @procedures = "Pickup in Progress"
      @updatecondition =1
    elsif @request.pickupscondition == "Pickup in Progress"
      @procedures = "Pickup Completed"
       @updatecondition =1
    elsif @request.pickupscondition == "Pickup Completed"
      @procedures = "Package in Store"
      @updatecondition =1
    end
    
    if  @updatecondition ==1
      @previoushistory = @request.pickupscondition.to_s
      @request.update_attributes(pickupscondition: @procedures)
      @request.save
      updatepickuprecord
      redirect_to current_user
    end
    
   
  end
  
  def updatepickupstatusback
    
    @request = Pickup.find(params[:selectedrequest])
    if @request.pickupscondition == "Pickup in Progress"
      @procedures = "Accepted"
      @updatecondition =1
    elsif @request.pickupscondition == "Pickup Completed"
      @procedures = "Pickup in Progress"
      @updatecondition =1
    end
    
    if  @updatecondition ==1
       @previoushistory = @request.pickupscondition.to_s
      @request.update_attributes(pickupscondition: @procedures)
      @request.save
      updatepickuprecord
      redirect_to current_user
    end
  end
  
  def updatedeliverystatusnext
    
    @request = Pickup.find(params[:selecteddrequest])
    if @request.pickupscondition == "Package in Store"
      @procedures = "Delivery in Progress"
      @updatecondition =1
    elsif @request.pickupscondition == "Delivery in Progress"
      @procedures = "Delivery Completed"
      @updatecondition =1
    elsif @request.pickupscondition == "Delivery Completed"
      @procedures = "Request Completed"
      @updatecondition =1
    end
    
    if  @updatecondition ==1
      @previoushistory = @request.pickupscondition.to_s
      @request.update_attributes(pickupscondition: @procedures)
      @request.save
      updatepickuprecord
      redirect_to current_user
    end
  end
  
  def updatedeliverystatusback
    @request = Pickup.find(params[:selecteddrequest])
    if @request.pickupscondition == "Delivery in Progress"
      @procedures = "Package in Store"
      @updatecondition =1
    elsif @request.pickupscondition == "Delivery Completed"
      @procedures = "Delivery in Progress"
      @updatecondition =1
    end
    
    if  @updatecondition ==1
      @previoushistory = @request.pickupscondition.to_s
      @request.update_attributes(pickupscondition: @procedures)
      @request.save
      updatepickuprecord
      redirect_to current_user
    end
  end
  
  def employeeabsence
    if current_user.identity ="driver"
      User.find(current_user.id).update_attributes(identity:"Absence")
    else
      User.find(current_user.id).update_attributes(identity:"driver")
    end
    redirect_to current_user
  end
  
  
  

  
private
    def user_params
      params.require(:user).permit(:name, :email,:identity, :password,
                                   :password_confirmation, :company, :address, :phone)
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
    
    def updatepickuprecord
      @checkPH = PickupHistory.where("pickupid = ? and condition=? ",@request.id.to_i,@procedures.to_s)
      if @checkPH.blank?
        @newPHistory = PickupHistory.new(condition: @procedures.to_s,pickupid: @request.id.to_i, employeeid: @request.employeeid.to_i)
        @newPHistory.save
      else
         @deletehistory = PickupHistory.where("pickupid = ? and condition=? ",@request.id.to_i,@previoushistory.to_s)
         if @deletehistory.blank?
         else
          @deletehistory.destroy_all
         end
         @checkPH.update_all(condition: @procedures.to_s)
         
      end
    end
  
end