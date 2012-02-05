
class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    @client = Foursquare2::Client.new(:oauth_token => current_user.access_token)
    results = @client.user(user.uid)
      user.first_name = results["firstName"]
      user.last_name = results["lastName"]
      user.image = results["photo"]
      user.save
    redirect_to dash_path, :notice => "Signed in!"
  end
  
  def new
  
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
  
end
