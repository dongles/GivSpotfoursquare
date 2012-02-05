class DashboardController < ApplicationController

def index
  if @current_user
    results = @client.user(@current_user.uid)
    if !@current_user.first_name
      @current_user.first_name = results["firstName"]
      @current_user.last_name = results["lastName"]
      @current_user.image = results["photo"]
      @current_user.save
    end
  end
end

end
