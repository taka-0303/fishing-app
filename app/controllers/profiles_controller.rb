class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def index
    @profile = current_user.profile
    @fish_names = current_user.fish_names.all.order("fish_kind ASC")
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
  end

  def update
    if @profile.update(profile_params)
      redirect_to root_path
    else 
      render :edit 
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:field, :text, :image, :career).merge(user_id: current_user.id)
  end
end
