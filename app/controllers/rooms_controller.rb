class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  # GET /rooms or /rooms.json
  def index
    @rooms= current_user.rooms
  
   
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)
    @room.user_id =current_user.id
   
    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_url(@room), notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
          #Viewのformで取得したパラメータをモデルに渡す
      @rooms = Room.search(params[:search])
    @room_total = @rooms.count
  end

  def area
    #Viewのformで取得したパラメータをモデルに渡す
@rooms = Room.area(params[:area])
@room_total = @rooms.count
end

def tokyo
  
  @rooms = Room.where(address:"東京")
  @room_total = @rooms.count
end

def oosaka
  
  @rooms = Room.where(address:"大阪")
  @room_total = @rooms.count
end


def sapporo
  
  @rooms = Room.where(address:"札幌")
  @room_total = @rooms.count
end


def kyouto
  
  @rooms = Room.where(address:"京都")
  @room_total = @rooms.count
end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
      
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:user_id, :room_image, :room_name, :introduce, :price, :address,:id)
    end
end
