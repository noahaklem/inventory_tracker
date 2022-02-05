module ApplicationHelper
  
  def logged_in?
    !!current_user
  end

  def current_user 
    session[:user_id].delete
    # @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_warehouse
    @warehouse ||= Warehouse.find(params[:warehouse_id]) if params[:warehouse_id]
  end
end
