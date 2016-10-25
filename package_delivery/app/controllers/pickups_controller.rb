class PickupsController < ApplicationController
  before_action :set_pickup, only: [:show, :edit, :update, :destroy]

  # GET /pickups
  # GET /pickups.json
  def index
    @pickups = Pickup.all
  end

  # GET /pickups/1
  # GET /pickups/1.json
  def show
  end

  # GET /pickups/new
  def new
    @pickup = Pickup.new
    @cid = User.find(params[:customer])
  end
  
  def newcustomerpickup
     @pickup = Pickup.new
     @cid = User.find(params[:customer])
  end

  # GET /pickups/1/edit
  def edit
  end

  # POST /pickups
  # POST /pickups.json
  def create
    @cid = User.all
    @pickup = Pickup.new(pickup_params)
    respond_to do |format|
      if @pickup.save
        @pickup_history = PickupHistory.new(condition: "Pending",employeeid: 0,pickupid: @pickup.id.to_i)
        @pickup_history.save
      
        format.html { redirect_to @pickup, notice: 'Pickup was successfully created.' }
        format.json { render :show, status: :created, location: @pickup }
      else
        format.html { render :new }
        format.json { render json: @pickup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pickups/1
  # PATCH/PUT /pickups/1.json
  def update
    respond_to do |format|
      if @pickup.update(pickup_params)
        format.html { redirect_to @pickup, notice: 'Pickup was successfully updated.' }
        format.json { render :show, status: :ok, location: @pickup }
      else
        format.html { render :edit }
        format.json { render json: @pickup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pickups/1
  # DELETE /pickups/1.json
  def destroy
    @pickup.destroy
    respond_to do |format|
      format.html { redirect_to pickups_url, notice: 'Pickup was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pickup
      @pickup = Pickup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pickup_params
      params.require(:pickup).permit(:name, :company, :address, :city, :state, :zip, :country, :number, :shipment_amount, :weight, :location_type, :package_location, :instructions, :pickup_date, :pickup_time, :customer_id,:delivery_type,:request_id,:totle_cost,:delivery_datetime)
    end
    
end
