class FishInfosController < ApplicationController
  before_action :set_name_info
  before_action :set_info, except: [:new, :create] 
  
  def new
    @fish_info = FishInfo.new
  end

  def create
    @fish_info = FishInfo.new(info_params)
    if @fish_info.save
      redirect_to fish_name_path(@fish_name)
    else 
      render :new 
    end
  end

  def edit
  end

  def update
    if @fish_info.update(info_params)
      redirect_to fish_name_path(@fish_name)
    else 
      render :edit
    end
  end

  def destroy
    @fish_info.destroy
    redirect_to fish_name_path(@fish_name)
  end

  private

  def set_name_info
    @fish_name = FishName.find(params[:fish_name_id])
  end

  def set_info
    @fish_info = FishInfo.find(params[:id])
  end

  def info_params
    params.require(:fish_info).permit(:day, :image, :fish_size, :fish_num, :memo).merge(user_id: current_user.id, fish_name_id: @fish_name.id)
  end
end
