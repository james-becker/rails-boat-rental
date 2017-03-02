class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:view_profile]
  def view_profile
    #view user profile
    @user = User.find(params[:id])
    @finished_reservations = @user.reservations.where(status: "finished").order(end_time: :desc) # ones finished last first
    @upcoming_reservations = @user.reservations.where(status: "confirmed").order(:end_time) # ones upcoming sooner first
    @pending_reservations = @user.reservations.where(status: "pending").order(:end_time)
    @user_boats = @user.boats
  end
end
