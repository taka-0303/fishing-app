class FishNamesController < ApplicationController
  before_action :set_name, except: :create
  
  def create
    @fish_name = FishName.new(name_params)
    if @fish_name.save
      redirect_to root_path
    else 
      redirect_to root_path
    end
  end

  def show
    @fish_infos = @fish_name.fish_infos.includes(:user).order("created_at DESC")
    @total = @fish_name.fish_infos.all.sum(:fish_num)
    @max_size = @fish_name.fish_infos.all.maximum(:fish_size)
  end

  def edit
  end

  def update
    if @fish_name.update(fish_name_params)
      redirect_to root_path
    else 
      render :edit
    end
  end

  def destroy
    @fish_name.destroy
    redirect_to root_path
  end

  private

  def set_name
    @fish_name = FishName.find(params[:id])
  end

  def fish_name_params
    params.require(:fish_name).permit(:fish_kind).merge(user_id: current_user.id)
  end

  def name_params
    params.permit(:fish_kind).merge(user_id: current_user.id)
  end
end
