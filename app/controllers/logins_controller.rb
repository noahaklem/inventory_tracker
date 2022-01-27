class LoginController < ApplicationController
  # skip_before_action :require_login, only: [:new, :create]

  # def create
  #   if user = User.authenticate(params[:email], params[:password])
  #     sessions[:current_user_id] = user.id
  #     flash[:notice] = "You're signed in!"
  #     redirect_to root_url
  #   else
  #     flash.now[:error] = "Hmm, you sure that's right?"
  #     render :new
  #   end
  # end

  # def destroy
  #   session.delete(:current_user_id)
  #   @_current_user = nil
  #   flash[:notice] = "You have successfully logged out."
  #   redirect_to root_url
  # end
end