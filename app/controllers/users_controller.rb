class UsersController < ApplicationController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
   sign_in_and_redirect @user, :event => "authentication"
   set_flash_message(:notice, :success, :kind => "facebook") if is_navigational_format?
    else
   sesssion["devise.facebook.data"] = request.env["omniauth.auth"]
   redirect_to new_user_registration_url
    end
  end
  
  def failure
    redirect_to root_url
  end
end
