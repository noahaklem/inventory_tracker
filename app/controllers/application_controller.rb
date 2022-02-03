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

  def is_title_case
    if name.split.any?{|w| w[0].upcase != w[0]}
      errors.add(:name, "Name must be in title case.")
    end
  end
  
  def make_title_case
    self.name = self.name.titlecase
  end
end
