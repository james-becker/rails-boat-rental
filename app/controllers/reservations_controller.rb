class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :update, :destroy, :show]
  before_action :set_boat, only: [:create, :new, :show]

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
    @reservation.destroy
    redirect_to users_show_profile_path(current_user.id)
  end

  def update
    #edit a specific reservation details
    @reservation.update(reservation_params)
    redirect_to @reservation
  end

  def new
    #make a reservation
    @reservation = Reservation.new
  end

  def create
    #make a reservation
    @reservation = Reservation.new(reservation_params)
    @reservation.status = "pending"
    @reservation.user = current_user || User.find(1) # this is only to simulate user, remove || 1 later
    @reservation.boat = @boat
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
    @boat = Boat.find(params[:boat_id]) if params[:boat_id]
    @boat = set_reservation.boat unless params[:boat_id]
  end

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :notes, :count, :user_id, :boat_id)
  end

end
