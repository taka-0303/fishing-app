class ProfilesController < ApplicationController
  def index
    @profile = current_user.profile
    @fish_names = current_user.fish_names.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find_by(params[:user_id])
  end

  def update
    @profile = Profile.find_by(params[:user_id])
    if @profile.update(profile_params)
      redirect_to root_path
    else 
      render :edit 
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:field, :text, :image, :career).merge(user_id: current_user.id)
  end
end
