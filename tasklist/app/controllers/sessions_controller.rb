class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:user][:username])
    if user
      flash[:notice] = "Logged In"
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:notice] = "User Name And Password Did Not Match"
      redirect_to root_url
    end
  end

  def destroy
    session.clear
    redirect_to root_url, notice: "Logged out!"
  end



  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
