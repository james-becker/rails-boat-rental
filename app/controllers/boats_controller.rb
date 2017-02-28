class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index,:search]
  before_action :set_boat, except: [:index, :new, :create, :search]

  def index
    #show all boats in the db
    # @boats = Boat.all
    @boat = Boat.new
    # # if params[:boat] && params[:boat][:capacity]
    # #   @boats = @boats.where(capacity: params[:boat][:capacity])
    # # end
    # if params[:boat] && params[:boat][:category]
    #   @boats = @boats.where(category: params[:boat][:category])
    # end
    @boats = Boat.all
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
  end

  def update
    #update a specific boat details, if you are the owner
  end
  def search
    @boat = params[:boat] ? Boat.new(search_boats_query(params[:boat])) : Boat.new
    @boats = params[:boat] ? Boat.where(search_boats_query(params[:boat])) : Boat.all
  end
  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:description, :category, :capacity, :price, :location, :user_id, :name)
  end
  def search_boats_query(params)
    query = {}
    query[:category] = params[:category] unless params[:category].empty?
    query[:capacity] = params[:capacity] unless params[:capacity].empty?

    query
  end
end
