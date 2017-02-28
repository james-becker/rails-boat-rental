class ReviewsController < ApplicationController

  def index
    #show all reviews of the user when he clicks a button on his home page
    @reviews = Review.all
  end

  def new
    #make a review
    @review = Review.new()
  end

  def create
    #make a review
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars, :user_id, :boat_id)
  end


end
