class PointsController < ApplicationController
  before_action :set_point, only: [:show, :edit, :update, :destroy]

  # Never trust parameters from the scary internet, only allow the white list through.
  def point_params
    params.require(:point).permit(:name, :address, :latitude, :longitude, :description, :category)
  end
  
  # GET /points
  # GET /points.json
  def index
    @all_categories = Point.all_categories
    @selected_categories = params[:categories] || session[:categories] || {}
    
    if @selected_categories == {}
      @selected_categories = Hash[@all_categories.map {|category| [category, category]}]
    end
    
    if params[:latitude] != nil and params[:latitude]["latitude"] != "" and params[:longitude]["longitude"] != ""
      @points = Point.where(category: @selected_categories.keys).nearbyPoints(params[:latitude], params[:longitude])
    else
      @points = Point.where(category: @selected_categories.keys)
    end
  end

  #      @points = Point.where(category: @selected_categories.keys).where("(((latitude - #{@latitude})**2 + (longitude - #{@longitude})**2)**0.5) < 200")

  # GET /points/1
  # GET /points/1.json
  def show
  end

  # GET /points/new
  def new
    @point = Point.new
  end

  # GET /points/1/edit
  def edit
  end

  # POST /points
  # POST /points.json
  def create
    @point = Point.new(point_params)

    respond_to do |format|
      if @point.save
        format.html { redirect_to @point, notice: 'Point was successfully created.' }
        format.json { render :show, status: :created, location: @point }
      else
        format.html { render :new }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /points/1
  # PATCH/PUT /points/1.json
  def update
    respond_to do |format|
      if @point.update(point_params)
        format.html { redirect_to @point, notice: 'Point was successfully updated.' }
        format.json { render :show, status: :ok, location: @point }
      else
        format.html { render :edit }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1
  # DELETE /points/1.json
  def destroy
    @point.destroy
    respond_to do |format|
      format.html { redirect_to points_url, notice: 'Point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end
end
