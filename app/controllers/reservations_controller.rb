class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :update, :destroy, :show]
  before_action :set_boat, only: [:create, :new]

  def index
    #functionality to show all reservations for that user
    #implemented in the users controller, view_profile method
  end

  def show
    #show a specific reservation details

  end

  def edit
    #edit a specific reservation details
  end

  def destroy
    #destroy a specific reservation
  end

  def update
    #edit a specific reservation details
  end

  def new
    #make a reservation
    @reservation = Reservation.new()
  end

  def create
    #make a reservation
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to @reservation
    else
      render :new
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :notes, :count, :status, :user_id, :boat_id)
  end

end
