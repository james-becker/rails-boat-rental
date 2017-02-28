class BoatsController < ApplicationController
  before_action :set_boat, except: [:index, :new, :create]

  def index
    #show all boats in the db
    @boats = Boat.all
  end

  def show
    #inspect a specific boat
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

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:description, :category, :capacity, :price, :location, :user_id, :name)
  end

end
