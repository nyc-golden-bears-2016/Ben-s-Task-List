class UsersController < ApplicationController

  def show
      @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Registration Successful"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = "Registration Unsuccessful"
      render :new
    end
  end

    private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
