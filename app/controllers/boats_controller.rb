class BoatsController < ApplicationController


  # skip_before_action :authenticate_user!, only: [:index,:search]

  before_action :set_boat, except: [:search, :index, :new, :create]

  def index
    @boat = Boat.new
    @boats = Boat.all

    unless params[:boat].nil?
      @boats = @boats.where(category: params[:boat][:category]) unless params[:boat][:category].empty?
    end

    unless params[:boat].nil?
      @boats = @boats.where('capacity > ?', params[:boat][:capacity].to_i) unless params[:boat][:capacity].empty?
    end

    unless params[:boat].nil?
      @boats = @boats.where('price < ?', params[:boat][:price].to_i) unless params[:boat][:price].empty?
    end

    @boats_on_map = @boats.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@boats_on_map) do |boat, marker|
      marker.lat boat.latitude
      marker.lng boat.longitude
      # marker.infowindow render_to_string(partial: "/boats/map_box", locals: { boat: boat })
    end

  end

  def show
    #inspect a specific boat
    @owner = User.find(@boat.user_id)
    @owner_name = @owner.first_name + @owner.last_name
  end

  def new
    #add a new boat, and become its owner
    @boat = Boat.new()
  end

  def create
    #add a new boat, and become its owner
    @boat = Boat.new(boat_params)
    @boat.user = current_user || User.find(1)
    if @boat.save
      redirect_to @boat
    else
      render :new
    end
  end

  def edit
    #edit a specific boat details, if you are the owner
  end

  def destroy
    #destroy a specific boat, if you are the owner
      @boat.destroy
      redirect_to boats_path
    else

  end

  def update
    #update a specific boat details, if you are the owner
    @boat.update(boat_params)
    redirect_to boats_path
  end

  def search
    @boats = Boat.all
    @boat = Boat.new


  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:description, :category, :capacity, :price, :location, :user_id, :name, photos: [])
  end
  def search_boats_query(params)
    query = {}
    query[:category] = params[:category] unless params[:category].empty?
    query[:capacity] = params[:capacity] unless params[:capacity].empty?
    query[:location] = params[:location].capitalize unless params[:location].empty?

    query
  end
end
