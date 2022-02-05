class ApplicationController < ActionController::Base
  before_action :login_required
  helper_method :current_user, :current_warehouse
  
  def current_user 
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def login_required
    unless logged_in?
      flash[:notice] = "Sign into your profile."
      redirect_to root_path
    end
  end

  def current_warehouse
    @warehouse ||= Warehouse.find(params[:warehouse_id]) if params[:warehouse_id]
  end

end
