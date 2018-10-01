class ReviewsController < ApplicationController

  def new
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to current_user
      notice[:success] = "You have been assigned a new book to review!"
  end
end

private

def review_params
  params.require(:review).permit(:user_id, :book_id, :claim)
end
