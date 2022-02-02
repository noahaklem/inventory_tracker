class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
  end
  
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to warehouses_path
    else
      flash[:notice] = "Hmm, that wasn't right. Try again."
      render :new
    end
  end

  def destroy
    session.delete :user_id
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end