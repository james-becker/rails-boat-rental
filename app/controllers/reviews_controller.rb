class ReviewsController < ApplicationController

  before_action :set_boat, only: [:create, :new]

  def new
    #make a review
    @review = Review.new
  end

  def create
    #make a review
    @review = Review.new(review_params)
    @review.user = current_user || User.find(1) # this is only to simulate user, remove || 1 later
    @review.boat = @boat
    if @review.save
      redirect_to @boat
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end

end
