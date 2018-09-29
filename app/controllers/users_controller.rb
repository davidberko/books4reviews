class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
  end

  def update
    @user = current_user
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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  end
end
