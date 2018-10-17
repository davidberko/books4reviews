class UsersController < ApplicationController


  def new_author
    @user = User.new
  end

  def new_reviewer
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @avg_rating = if @user.reviews.blank?
    0
    else
      @user.reviews.average(:rating).round(2)
    end
  end


  def profile
    @current_user = current_user
    @helpful = current_user.reviews.where(helpful: true)
    @unhelpful = current_user.reviews.where(unhelpful: true)
    @reviews = current_user.reviews
    unhelpful = @unhelpful.count
    total = @reviews.count
    subtotal = total - unhelpful
    @score = subtotal.to_f / total

  end

  def reviewer
    @users = User.where(["access_level = ?", "1"])
    @users.sort_by { |n| n.reviews.length }
  end

  def author
    @authors = User.where(access_level: :author)
    @authors.joins(:review).merge(Review.reorder(created_at: :desc))
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar, :access_level)
  end

end
