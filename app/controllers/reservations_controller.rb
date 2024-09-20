class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]
 

  # GET /reservations or /reservations.json
  def index
    
    @reservations =current_user.reservations
    
        
  end
  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @room = Room.find(params[:room_id])
   @reservation = @room.reservations.new

  end

  def confirm
    @room = Room.find(params[:room_id])
     @reservation = @room.reservations.new(reservation_params)
    

    render :new if @reservation.invalid?
    
end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    
    
    @reservation =Reservation.new(reservation_params)

  
    
  
    if params[:back] || !@reservation.save
        render :new
    else
        redirect_to action: :index, notice: "Reservation was successfully created."
    end
end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end


   
    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:id,:room_id,:start_date, :end_date, :people,:user_id).merge(user_id:current_user.id)
    end

  
end

