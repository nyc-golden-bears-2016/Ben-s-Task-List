class ErrandsController < ApplicationController

  def show
    if logged_in?
      @errands = current_user.errands.order(:created_at)
    else
      redirect_to new_session_path
    end
  end

  def new
    @errand = Errand.new
  end

  def create
    @errand = Errand.new(errand_params)
    if @errand.save
      flash[:notice] = "Task Created"
      redirect_to_root_path
    else
      flash[:notice] = "Task NOT Created"
      render :new
    end
  end

  def complete
    errand = Errand.find(params[:id])
    errand.toggle_completeness
    redirect_to_root_path
  end

  def edit
    @errand = Errand.find(params[:id])
  end

  def update
    @errand = Errand.find(params[:id])
    if @errand.update_attributes(errand_params)
      flash[:notice] = "Task Updated Successfully"
      ren
    else
      flash[:notice] = "Task NOT Updated"
      render :edit
    end
  end

  def destroy
    @errand = Errand.find(params[:id])
    @errand.destroy
    flash[:notice] = "Task Deleted"
    redirect_to_root_path
  end

  private

  def errand_params
      params.require(:errand).permit(:description)
  end

end
