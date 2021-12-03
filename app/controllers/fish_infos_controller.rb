class FishInfosController < ApplicationController
  def new
    @fish_name = FishName.find(params[:fish_name_id])
    @fish_info = FishInfo.new
  end

  def create
    @fish_name = FishName.find(params[:fish_name_id])
    @fish_info = FishInfo.new(info_params)
    if @fish_info.save
      redirect_to fish_name_path(@fish_name)
    else 
      render :new 
    end
  end

  def edit
    @fish_name = FishName.find(params[:fish_name_id])
    @fish_info = FishInfo.find(params[:id])
  end

  def update
    @fish_name = FishName.find(params[:fish_name_id])
    @fish_info = FishInfo.find(params[:id])
    if @fish_info.update(info_params)
      redirect_to fish_name_path(@fish_name)
    else 
      render :edit
    end
  end

  def destroy
    @fish_name = FishName.find(params[:fish_name_id])
    @fish_info = FishInfo.find(params[:id])
    @fish_info.destroy
    redirect_to fish_name_path(@fish_name)
  end

  private

  def info_params
    params.require(:fish_info).permit(:day, :image, :fish_size, :fish_num, :memo).merge(user_id: current_user.id, fish_name_id: @fish_name.id)
  end
end
