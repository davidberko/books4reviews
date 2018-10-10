class UsersController < ApplicationController

  def new_author
    @user = User.new
  end

  def new_reviewer
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end


  def profile
    @current_user = current_user
  end

  def reviewer
    @users = User.where(["access_level = ?", "1"])
  end

  def author
    @authors = User.where(access_level: :author)
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
