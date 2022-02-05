class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to warehouses_path
    else
      flash[:notice] = "Nope, something is not right."
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
