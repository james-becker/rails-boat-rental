class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    #view home page
    # 1. inside the banner : search, filter boats by location
    @boats = Boat.most_booked(3)
    @boat = Boat.new
    # 2. return n most booked

  end
end
