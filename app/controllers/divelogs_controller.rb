class DivelogsController < ApplicationController
  before_action :set_divelog, only: [:show, :edit, :update, :destroy]

  # GET /divelogs
  # GET /divelogs.json
  def index
    @divelogs = Divelog.all
  end

  # GET /divelogs/1
  # GET /divelogs/1.json
  def show
    @divelogs = Divelog.all
    @hash = Gmaps4rails.build_markers(@divelogs) do |divelog, marker|
      marker.lat divelog.latitude
      marker.lng divelog.longitude
      marker.infowindow divelog.point
    end  
  end

  # GET /divelogs/new
  def new
    @divelog = Divelog.new
  end

  # GET /divelogs/1/edit
  def edit
  end

  # POST /divelogs
  # POST /divelogs.json
  def create
    @divelog = Divelog.new(divelog_params)

    respond_to do |format|
      if @divelog.save
        format.html { redirect_to @divelog, notice: 'Divelog was successfully created.' }
        format.json { render action: 'show', status: :created, location: @divelog }
      else
        format.html { render action: 'new' }
        format.json { render json: @divelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /divelogs/1
  # PATCH/PUT /divelogs/1.json
  def update
    respond_to do |format|
      if @divelog.update(divelog_params)
        format.html { redirect_to @divelog, notice: 'Divelog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @divelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /divelogs/1
  # DELETE /divelogs/1.json
  def destroy
    @divelog.destroy
    respond_to do |format|
      format.html { redirect_to divelogs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_divelog
      @divelog = Divelog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def divelog_params
      params.require(:divelog).permit(:date, :point, :description, :picture, :latitude, :longitude)
    end
end
