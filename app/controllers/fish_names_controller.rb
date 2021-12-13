class FishNamesController < ApplicationController
  
  def create
    @fish_name = FishName.new(fish_name_params)
    if @fish_name.save
      redirect_to root_path
    else 
      redirect_to root_path
    end
  end

  def show
    @fish_name = FishName.find(params[:id])
    @fish_infos = @fish_name.fish_infos.includes(:user)
    @total = @fish_name.fish_infos.all.sum(:fish_num)
    @max_size = @fish_name.fish_infos.all.maximum(:fish_size)
  end

  def edit
    @fish_name = FishName.find(params[:id])
  end

  def update
    @fish_name = FishName.find(params[:id])
    if @fish_name.update(fish_name_params)
      redirect_to fish_name_path(@fish_name)
    else 
      render :edit
    end
  end

  def destroy
    @fish_name = FishName.find(params[:id])
    @fish_name.destroy
    redirect_to root_path
  end

  private

  def fish_name_params
    params.permit(:fish_kind).merge(user_id: current_user.id)
  end
end
